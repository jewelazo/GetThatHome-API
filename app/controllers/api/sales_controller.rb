module Api
  class SalesController < ApiController
    skip_before_action :authorized_token, only: %i[index]
    def index
      render json: Sale.all
    end

    def create
      @sale = Sale.new(sale_params)
      if @sale.save
        render json: @sale
      else
        render json: @sale.errors, status: :unprocessable_entity
      end
    end

    private

    def sale_params
      params.permit(:id, :price)
    end
  end
end
