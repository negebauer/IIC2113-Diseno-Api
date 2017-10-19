# SessionsController
class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create], raise: false

  def create
    user = User.valid_login?(params[:mail], params[:password])
    if user
      allow_token_to_be_used_only_once_for(user)
      send_auth_token_for_valid_login_of(user)
    else
      render_unauthorized('Invalid credentials')
    end
  end

  def destroy
    logout
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  private

  def logout
    current_user.invalidate_token
  end
end
