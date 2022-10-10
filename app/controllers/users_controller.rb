class UsersController < ApplicationController
  def index
    @users=User.all
  end
  def new
    @new_user=User.new
  end

  def create
    @user=User.create(user_params)
    if @user
      flash[:success]=" user created successfully"
      redirect_to register_path
    end
  end

  private
   def user_params
    params.require(:user).permit(:email, :password)
   end
end
