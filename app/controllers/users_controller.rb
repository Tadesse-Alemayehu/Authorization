class UsersController < ApplicationController
  def new
    @new_user=User.new
  end
  def create
    @user=User.create(user_params)
    if @user
      flash[:success]=" user created successfully"
      redirect_to users_new_path
    end
  end

  private
   def user_params
    params.require(:user).permit(:email, :password)
   end
end
