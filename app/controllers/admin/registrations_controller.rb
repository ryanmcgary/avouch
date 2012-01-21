class Admin::RegistrationsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index # Stupid but being used for "user/edit"
  	
  end


end