# ApplicationController
include ActionController::HttpAuthentication::Token::ControllerMethods
class ApplicationController < ActionController::API
  def index
    @on = true
    @timestamp = Time.now.strftime.in_time_zone
  end

  def require_login
    authenticate_token || render_unauthorized('Acceso denegado')
  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected

  def render_unauthorized(message)
    render json: { message: message }, status: :forbidden
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      user = User.find_by(token: token)
      if user
        ActiveSupport::SecurityUtils.secure_compare(
          ::Digest::SHA256.hexdigest(token),
          ::Digest::SHA256.hexdigest(user.token)
        )
        user
      end
    end
  end

  def send_auth_token_for_valid_login_of(user)
    render json: { api_key: user.token }, status: :created
  end

  def allow_token_to_be_used_only_once_for(user)
    user.regenerate_token
  end
end
