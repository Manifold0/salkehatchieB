class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
  end

  def after_sign_in_path_for(user)
  	if current_user.is_admin?
  		return admin_camps_path
  	elsif(current_user.first_name == nil)
   		return user_basic_info_path
    elsif current_user.current_camps_assigned.length > 0
      return camp_path(current_user.current_camps_assigned[0].camp)
    else
      return request_camps_path
	  end
  end

  def admin_filter
  	if !current_user.is_admin?
  		redirect_to root_path
  	end
  end
 
  def camp_director_filter
  	if !current_user.is_camp_director?
  		redirect_to root_path
  	end
  end


def site_leader_filter
	if !current_user.is_site_leader?
		redirect_to root_path
	end
end

def parent_filter
	if !current_user.is_parent?
		redirect_to root_path
	end
end

def camper_filter 
	if !current_user.is_camper?
		redirect_to root_path
	end
 end
end
