class SessionController < ApplicationController
  before_action :current_user, only: %i[destroy]
  def new
    @new_user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.is_password?(user_params[:password])

      session[:user_id]=@user.id
      flash[:notice] = "Singed in successfully"
      redirect_to user_path, **flash
    else
      flash.now[:alert] = "user name or password is not valid"
      render :new
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
