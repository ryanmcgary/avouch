class Admin::SitesController < ApplicationController
	layout 'admin'
	respond_to :js
		
	def show
		
	end
		
	def index
		#@recordings = current_user.sites
		#@recordings = Recording.get_user_sites_recordings(current_user.id).sortdesc#.call_completed
		if params[:site].nil? || params[:site].value?("")
			@recordings = Recording.get_user_sites_recordings(current_user.id).sortdesc#.call_completed
		else
			@recordings = Recording.get_user_sites_recordings(current_user.id).sortdesc.sites_id(params[:site].values)#.call_completed
		end

		@sites = Site.all
	  respond_to do |format|
       	format.html
        format.js
    end

	end

	def install
	end

	def toggle_approve  
	  @a = Recording.find(params[:id])  
	  @a.toggle!(:call_completed)  
	  respond_to do |format|
        format.js
    end
	end  

end