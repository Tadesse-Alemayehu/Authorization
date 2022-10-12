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
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:success] = " user created successfully"
      redirect_to user_path, **flash
    else
      flash.now[:error]=@user.errors.full_messages.to_sentence
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
