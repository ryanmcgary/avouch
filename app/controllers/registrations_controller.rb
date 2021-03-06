class RegistrationsController < Devise::RegistrationsController
  layout 'devise'
  
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end
  
  def update
    # Devise use update_with_password instead of update_attributes.
    # This is the only change we make.
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      # Line below required if using Devise >= 1.2.0
      sign_in resource_name, @user, :bypass => true 
      redirect_to after_update_path_for(resource)
      # TODO: Change redirect to force
    else
      clean_up_passwords(resource)
      if request.referrer.include? "admin"
      # TODO: Fix reverting back to current settings: Also this is horrible monkey patch
        session[:wtf] = resource.errors
        redirect_to after_update_path_for(resource)
      else
        render_with_scope :edit
      end
    end
  end

  protected
  
  # def return_to_referrer
  #   session[:return_to] = request.referrer    
  # end    
  # in a helper if remoteurl save request.referrer

  # def after_sign_up_path_for(resource_or_scope)
  #   if !session[:return_to].nil?
  #     authentications_closewindow_path
  #   else   
  #     admin_sites_path
  #   end      
  # end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?       
    end
  end
  
  
end
