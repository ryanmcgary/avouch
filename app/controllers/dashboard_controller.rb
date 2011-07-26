class DashboardController < ApplicationController
  before_filter :authenticate_user!   
  def install
  end

  def moderation
  end

  def administration
  end

end
