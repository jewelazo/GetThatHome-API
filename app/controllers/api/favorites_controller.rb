module Api
  class FavoritesController < ApiController
    skip_before_action :authorized_token, only: %i[index]
    before_action :set_favorite, only: %i[update]

    def index
      render json: Favorite.all, include: [property: { include: :propertiable }]
    end

    def create
      @favorite = Favorite.new(favorite_params)
      @favorite.user = current_user
      if @favorite.save
        render json: @favorite
      else
        render json: @favorite.errors, status: :unprocessable_entity
      end
    end

    def update
      if @favorite.update(favorite_params)
        render json: @favorite
      else
        render json: @favorite.errors, status: :unprocessable_entity
      end
    end

    private

    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.permit(:id, :property_id, :favorite, :contacted)
    end
  end
end
