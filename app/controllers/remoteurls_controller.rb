class RemoteurlsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  layout 'remotelayout'

  
  def index # GET /remoteurls # GET /remoteurls.xml
    @site = Site.find_by_permalink(params[:site_id]) 
    @recordings = @site.recordings #show all recordings for site

    # @remoteurl = Remoteurl.find_by_permalink(params[:remoteurl])
    # @recording = @remoteurl.recordings.where(:call_completed => "1")  

  end

  def show
    # so basically all that is needed here is the remoteurl[:id] as part of the param, if a number or string is used then you don't have to hit the DB
    # So I might just grab everything in the lanyard controller and use #ID's from there
    session[:return_to] = params
    
    # @site = Site.find_by_permalink(params[:site_id])
          # if @site.remoteurls.find_by_permalink(params[:id]).nil? 
          #   @remoteurl = @site.remoteurls.build(params[:remoteurl])
          #   @remoteurl.name = (params[:id])
          #   respond_to do |format|
          #     if @remoteurl.save
          #       format.html { redirect_to "/sites/#{@site.permalink}/remoteurls/#{@remoteurl.permalink}?layout=#{params[:layout]}"}
          #       format.xml  { render :xml => @site, :status => :created, :location => @remoteurl }
          #     else
          #       format.html { render :action => "new" }
          #       format.xml  { render :xml => [@site, @remoteurl].errors, :status => :unprocessable_entity }
          #     end
          #   end
          # else
    # @remoteurl = @site.remoteurls.find_by_permalink(params[:id])
    # end 
    
  end

  def new
    @site = Site.find_by_permalink(params[:site_id])  
    @remoteurl = @site.remoteurls.build
  end

  
  def edit # GET /remoteurls/1/edit
    @site = Site.find_by_permalink(params[:site_id])  
    @remoteurl = @site.remoteurls.find_by_permalink(params[:id])
  end

  
  def create # POST /remoteurls # POST /remoteurls.xml
    @site = Site.find_by_permalink(params[:site_id])  
    @remoteurl = @site.remoteurls.build(params[:remoteurl])

    respond_to do |format|
      if @remoteurl.save
        format.html { redirect_to([@site, @remoteurl], :notice => 'Remoteurl was successfully created.') }
        format.xml  { render :xml => @site, :status => :created, :location => @remoteurl }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => [@site, @remoteurl].errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update # PUT /remoteurls/1 # PUT /remoteurls/1.xml
    @site = Site.find_by_permalink(params[:site_id])   
    @remoteurl = @site.remoteurls.find_by_permalink(params[:id])

    respond_to do |format|
      if @remoteurl.update_attributes(params[:remoteurl])
        format.html { redirect_to([@site, @remoteurl], :notice => 'Remoteurl was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => [@site, @remoteurl].errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def destroy # DELETE /remoteurls/1 # DELETE /remoteurls/1.xml
    @site = Site.find_by_permalink(params[:site_id])   
    @remoteurl = @site.remoteurls.find_by_permalink(params[:id])
    @remoteurl.destroy
    
    respond_to do |format| 
      format.html { redirect_to(site_remoteurls_path) }
      format.xml  { head :ok }
    end
  end
end
