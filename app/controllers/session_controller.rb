class SessionController < ApplicationController
  before_action :current_user, only: %i[destroy]
  def new
    @new_user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.password == user_params[:password]

      session[:user_id]=@user.id
      flash[:notice] = "user created successfully"
      redirect_to user_path, **flash
    else
      flash.now[:alert] = "fail to create user"
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
