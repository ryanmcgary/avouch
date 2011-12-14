class Site < ActiveRecord::Base
  has_many :remoteurls
  belongs_to :user
  has_many :recordings, :through => :remoteurls
  
  before_validation :create_permalink
  
  validates :name,        :presence     => true,
                          :length       => { :maximum  => 50 }
  validates_uniqueness_of :permalink, :on => :create, :message => "must be unique"
  
  include MakePermalink
  
  def to_param
    permalink
  end  

end
