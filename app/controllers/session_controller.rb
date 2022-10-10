class SessionController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.password == user_params[:password]
      cookies[:user_id] = @user.id
      flash[:notice] = "user created successfugdfglly"
      redirect_to users_show_path, **flash
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
