class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)
    if user.save
      allow_token_to_be_used_only_once_for(user)
      send_auth_token_for_valid_login_of(user)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:mail, :name, :password, :password_confirmation)
  end
end
