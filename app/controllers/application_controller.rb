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
    else
      install_dashboard_path 
    end 
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if request.referrer.include? "remoteurls"
      authentications_closewindow_path
    else
      install_dashboard_path 
    end
  end
  
end