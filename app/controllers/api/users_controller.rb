# rubocop:disable Metrics/AbcSize
# rubocop:disable Layout/LineLength
module Api
  class UsersController < ApiController
    skip_before_action :authorized_token, only: %i[create]
    before_action :set_user, only: %i[show update]
    def index
      @users = User.all
      render json: @users
    end

    def show
      render json: @user.as_json.merge({ favorites: @user.favorites.map do |f|
        f.as_json(include: [property: { include: :propertiable }]).merge({ photos: f.property.photos.map do |photo|
                                                                                     { url: url_for(photo) }
                                                                                   end })
      end }).merge({ properties: @user.properties.map do |p|
        p.as_json(include: [:propertiable]).merge({ photos: p.photos.map do |photo|
                                                              { url: url_for(photo) }
                                                            end })
      end })
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.permit(:id, :email, :name, :phone, :role, :password, :password_confirmation)
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Layout/LineLength
