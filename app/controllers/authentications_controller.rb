class AuthenticationsController < ApplicationController
  before_filter :authenticate_user!, :only => [:closewindowprotected, :index, :destroy]   
  
  def index
    @authentications = current_user.authentications if current_user
  end

  def create 
    omniauth = request.env["omniauth.auth"] 
    # render :text => omniauth['uid']
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)     
    elsif current_user          
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save 
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)      
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end 
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
  
  def closewindow
    render :layout => "remotelayout"
  end
  
  def closewindowprotected
    render :layout => "remotelayout"
  end
  
  protected

  def handle_unverified_request
    true
  end
  
  # This is necessary since Rails 3.0.4
  # See https://github.com/intridea/omniauth/issues/185
  # and http://www.arailsdemo.com/posts/44    
end   
