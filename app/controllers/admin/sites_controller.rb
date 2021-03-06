class Admin::SitesController < ApplicationController
	before_filter :authenticate_user!
	layout 'admin'
	respond_to :js
		
	def show
		
	end

	def new
    @site = Site.new
	end	

	def create
	  @site = current_user.sites.build(params[:site])

	  respond_to do |format|
	    if @site.save
	      format.html { redirect_to(admin_sites_install_path, :notice => 'Site was successfully created.') }
	    else
	      format.html { render :action => "new" }
	    end
	  end
	end

	def index
		#@recordings = current_user.sites
		#@recordings = Recording.get_user_sites_recordings(current_user.id).sortdesc#.call_completed
		if params[:site].nil? || params[:site].value?("")
			@recordings = Recording.get_user_sites_recordings(current_user.id).sortdesc.audio_saved.paginate :page => params[:page], :per_page => 20
			#.call_completed
		else
			@recordings = Recording.get_user_sites_recordings(current_user.id).sortdesc.sites_id(params[:site].values).audio_saved.paginate :page => params[:page], :per_page => 20
			#call_completed
		end

		@sites = Site.where(:user_id => current_user)
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