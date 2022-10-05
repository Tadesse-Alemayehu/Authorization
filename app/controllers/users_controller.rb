class UsersController < ApplicationController
  def new
    @new_user=User.new
  end
  def create
  end
end
