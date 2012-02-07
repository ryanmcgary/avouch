class LanyardsController < ApplicationController

#  TODO: Before filter to make embed find permalink_URL
  # before_filter :make_permalink, :except => [:show] 
  include MakePermalink   
  def show
    @site = Site.find_by_permalink(params[:site_id])   

    #@speaker.lanyard_log(request.env["HTTP_REFERER"], params[:v])    

    # /speakers/Scott_Hanselman/badge/embed?v=1
    #render :partial => "embed.js.erb", :content_type => 'application/javascript'
  end
  
  def embed 
    @domainref = make_permalink(URI(request.referrer).host.to_s)
    
    

    # if param remoteurl_id not passed by javascript embed use refferer
    if params[:remoteurl].nil?
      @pathref = url_escape(URI(request.referrer).path.to_s)
      @pathrefx2 = url_escape(@pathref)
    else
      @pathref = params[:remoteurl]
    end
    
    @site = Site.find_by_permalink(params[:site_id])
    @remoteurl = @site.remoteurls.find_or_create_by_permalink(@pathref, :include => [:recordings => :user ])


    
    # maybe change to find by or create? How about I use a single query in the recording.model?
    # maybe use whole url for "remoteurl" and then prevent duplicates?
    
    render :partial => "embed.js.erb", :content_type => 'application/javascript'

    #@site = Site.find_by_permalink(params[:site_id])
    #@remoteurl = @site.remoteurls.find_by_permalink(params[:id])
    #@site = Site.first(:conditions => {:permalink => params[:id]})
    #@site.(request.env["HTTP_REFERER"], params[:v])    
  end

 
end
