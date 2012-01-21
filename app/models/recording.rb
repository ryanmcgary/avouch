class Recording < ActiveRecord::Base
  attr_accessible :audio_file, :remoteurl_id, :call_id, :synopsis, :call_completed 
  
  belongs_to :remoteurl
  belongs_to :user

  scope :call_completed, :conditions => [ "audio_file != ''" ]
  scope :sortdesc, :order => "recordings.created_at DESC"
  scope :sites_id, lambda { |price| where("site_id = ?", price) }
  scope :groupen, group("site_id")

  def site_name
  	remoteurl.site.permalink
  end

  def self.get_user_sites_recordings(current_user)
  	Recording.joins(:remoteurl => {:site => :user}).select("recordings.*, recordings.id as recordid, remoteurls.permalink, sites.permalink as site_permalink, sites.id as site_id, users_recordings.*").joins(:user).where("users.id = '#{current_user}'")
  end

end
