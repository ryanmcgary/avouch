class RegistrationsController < Devise::RegistrationsController
  
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
      render_with_scope :edit
    end
  end
  
  protected

  def after_sign_up_path_for(resource_or_scope)
      authentications_closewindow_path 
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?       
    end
  end
  
  
end
