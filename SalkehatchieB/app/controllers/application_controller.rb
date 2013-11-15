class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to :back
  end

  def after_sign_in_path_for(user)
  	if current_user.is_admin?
  		return admin_camps_path
  	else
   		return camps_path
	end
  end


end
