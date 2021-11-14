class ApiController < ActionController::API
  before_action :authorized_token

  include ActionController::HttpAuthentication::Token::ControllerMethods

  def current_user
    authenticate_token
  end

  def authorized_token
    authenticate_token || unauthorized_request('Access denied')
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      User.find_by(token: token)
    end
  end

  def unauthorized_request(message)
    render json: { message: message }, status: :unauthorized
  end
end
