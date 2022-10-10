class ApplicationController < ActionController::Base
  add_flash_types :info, :warning, :error, :success
  helper_method :current_user

  def current_user
    User.find(cookies[:user_id]) if (cookies[:user_id])
  end
end
