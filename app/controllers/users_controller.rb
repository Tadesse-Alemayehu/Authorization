class UsersController < ApplicationController
  before_action :current_user, only: %i[show destroy]
  def index
    @users = User.all
  end
  def new
    @new_user = User.new
  end

  def show
    # @current_user=User.new
  end

  def show

  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id]=@user.id
      flash[:success] = " user created successfully"
      redirect_to user_path, **flash
    end
  end

  def destroy
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
