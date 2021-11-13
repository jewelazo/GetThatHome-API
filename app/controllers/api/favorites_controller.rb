module Api
  class FavoritesController < ApiController
    def index
      render json: Favorite.all, include: [property: { include: :propertiable }]
    end

    def create
      @favorite = Favorite.new(favorite_params)
      if @favorite.save
        render json: @favorite
      else
        render json: @favorite.errors, status: :unprocessable_entity
      end
    end

    private

    def favorite_params
      params.permit(:id, :user_id, :property_id)
    end
  end
end
