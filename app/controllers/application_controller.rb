class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = '*'
   headers['Access-Control-Request-Method'] = '*'
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if request.referrer.include? "remoteurls"
      request.referrer
    else
      super
    end
  end  
  
  def after_update_path_for(resource)
    if params[:layout] == "embed"
      authentications_closewindowprotected_path  
    elsif request.referrer.include? "admin"
      admin_registrations_path
    else
      edit_user_registration_path
    end 
  end
  
  def after_sign_in_path_for(resource_or_scope)
    session[:profile_pic] = current_user.profile_pic
    cookies[:profile_pic] = current_user.profile_pic
    session[:full_name] = current_user.full_name
    session[:title] = current_user.title
    session[:company] = current_user.company
    if !session[:return_to].nil? # || request.referrer.include? "remoteurls" 
      authentications_closewindow_path # uncomment if api.iavouch ends up being used
    elsif request.referrer.include? "remoteurls"
      authentications_closewindow_path
    else
      authentications_closewindow_path
    end
  end

    protected

  def after_sign_up_path_for(resource)
    if request.referrer.include? "remoteurls"
      authentications_closewindow_path
    # elsif !session[:return_to].nil? # uncomment if api.iavouch ends up being used
    #   authentications_closewindow_path
    else
      admin_sites_path 
    end
  end

  
end