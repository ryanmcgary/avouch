class Recording < ActiveRecord::Base
  attr_accessible :audio_file, :remoteurl_id, :call_id, :synopsis, :call_completed 
  
  belongs_to :remoteurl
  belongs_to :user

  scope :call_completed, where(:call_completed => "1")


  def site_name
  	remoteurl.site.permalink
  end

end
