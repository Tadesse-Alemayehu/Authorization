class ApplicationController < ActionController::Base
  add_flash_types :info, :warning, :error, :success
  helper_method :current_user

  def current_user

    if session[:user_id] && User.find_by_id(session[:user_id])
      return User.find session[:user_id]
    else
      redirect_to sign_in_path, alert: "You need to sign in to access pages"
      return nil
    end
  end

end
