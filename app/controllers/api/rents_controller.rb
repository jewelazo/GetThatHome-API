module Api
  class RentsController < ApiController
    skip_before_action :authorized_token, only: %i[index]
    def index
      render json: Rent.all
    end

    def create
      @rent = Rent.new(rent_params)
      if @rent.save
        render json: @rent
      else
        render json: @rent.errors, status: :unprocessable_entity
      end
    end

    private

    def rent_params
      params.permit(:id, :monthly_rent, :maintenance, :pet)
    end
  end
end
