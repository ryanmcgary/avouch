class Remoteurl < ActiveRecord::Base
  belongs_to :site
  has_many :recordings
  
  before_validation :create_permalink
  
  include MakePermalink # slugs .name column to .permalink
      

  def to_param
    permalink
  end 
     
end
