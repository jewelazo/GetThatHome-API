module Api
  class UsersController < ApiController
    skip_before_action :authorized_token, only: %i[create]
    before_action :set_user, only: %i[show update]

    def index
      render json: User.all
    end

    def show
      render json: @user
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
