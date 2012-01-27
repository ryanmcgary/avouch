class Site < ActiveRecord::Base
  has_many :remoteurls, :dependent => :destroy
  belongs_to :user
  has_many :recordings, :through => :remoteurls, :order => 'created_at DESC'
  
  before_validation :create_permalink
  
  validates :name,        :presence     => true,
                          :length       => { :maximum  => 50 }
  validates_uniqueness_of :permalink, :on => :create, :message => "already taken"
  validates_uniqueness_of :name, :on => :create, :message => "already taken"
  
  include MakePermalink
  
  def to_param
    permalink
  end  

end
