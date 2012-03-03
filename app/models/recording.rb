class Recording < ActiveRecord::Base
  attr_accessible :audio_file, :remoteurl_id, :call_id, :synopsis, :call_completed 
  
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :remoteurl
  belongs_to :user

  scope :call_completed, where(:call_completed => true)
  scope :audio_saved, :conditions => [ "audio_file != ''" ]
  scope :sortdesc, :order => "recordings.created_at DESC"
  scope :sites_id, lambda { |price| where("site_id = ?", price) }
  scope :groupen, group("site_id")

  def site_name
  	remoteurl.site.permalink
  end

  def self.get_user_sites_recordings(current_user)
  	Recording.joins(:remoteurl => {:site => :user}).select("recordings.*, recordings.id as recordid, remoteurls.permalink, sites.permalink as site_permalink, sites.id as site_id, users_recordings.*").joins(:user).where("users.id = '#{current_user}'")
  end

  def update_counter_cache
    self.remoteurl.recordings_count = Recording.count( :conditions => ["call_completed = 't' AND remoteurl_id = ?", self.remoteurl.id])
    self.remoteurl.save
  end

end
