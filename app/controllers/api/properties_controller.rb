module Api
  class PropertiesController < ApiController
    skip_before_action :authorized_token, only: %i[show index]
    before_action :set_property, only: %i[show update]

    def index
      @properties = Property.all
      render json: @properties, include: [:propertiable]
    end

    def show
      render json: @property, include: %i[user propertiable]
    end

    def update
      @property.propertiable = propertiable_item if propertiable_item
      if @property.update(properties_params)
        render json: @property
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    end

    def create
      @property = Property.new(properties_params)
      @property.user = current_user
      @property.propertiable = propertiable_item  
      if @property.save
        render json: @property
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    end

    private

    def set_property
      @property = Property.find(params[:id])
    end

    def properties_params
      params.permit(:id, :address, :property_type, :bedrooms, :bathrooms, :area, :description,
                    :propertiable)
    end

    def rent_params
      params.permit(:monthly_rent, :maintenance, :pet)
    end

    def sale_params
      params.permit(:price)
    end

    def propertiable_item
      unless params[:monthly_rent].nil? || params[:maintenance].nil? || params[:pet].nil?
        return Rent.new(rent_params)
      end
      return Sale.new(sale_params) unless params[:price].nil?
    end
  end
end
