module Api
  class PropertiesController < ApiController
    before_action :set_property, only: %i[show update]

    def index
      render json: Property.all
    end

    def show
      render json: @property
    end

    def update; end

    def create
      @propertiable = propertiable_item
      @property = Property.new(properties_params)
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
                    :propertiable, :user_id)
    end

    def propertiable_item
      return Sale.find(params[:sale_id]) unless params[:sale_id].nil?
      return Rent.find(params[:rent_id]) unless params[:rent_id].nil?
    end
  end
end
