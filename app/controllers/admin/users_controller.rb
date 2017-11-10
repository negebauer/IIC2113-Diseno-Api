module Admin
  class UsersController < AdminController
    def index
      @users = User.all
      render :index, status: :ok
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render :show, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:mail, :name, :password, :password_confirmation)
    end
  end
end
