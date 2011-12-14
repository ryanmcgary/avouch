class DashboardsController < ApplicationController
  before_filter :authenticate_user!   

  

  def install
  	# current_user.sites
  	# dashboard/site/new
  	# dashboard/site/test
  end

  def moderation
  	# current_user.sites
	  	# dashboard/recordings
	  		# list what site/remoteurl the recording is from
	  			# allow to list by site/remoteurl
  end

  def administration
  	# change user info /user
  		# Add change phone switchboard info
  	# add fastpass 900#
  	# upgrade to paid account
  end

end
