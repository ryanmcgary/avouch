class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_out_path_for(resource_or_scope)
    if request.referrer.include? "remoteurls"
      request.referrer
    else
      super
    end

  end
end
