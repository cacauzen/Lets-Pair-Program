class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def confirm_admin
    unless current_user.try(:admin?)
      flash[:alert] = "User doesn't have required permissions"
      redirect_to root_path
    end
  end
end
