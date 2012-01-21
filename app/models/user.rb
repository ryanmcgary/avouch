class User < ActiveRecord::Base
  has_many :authentications, :foreign_key => "user_id", :dependent => :destroy
  has_many :recordings
  has_many :sites, :dependent => :destroy
  has_many :remoteurls, :through => :sites
  # has_many :arecordings, :through => :remoteurls, :source => :recordings
                                
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :phone_number, :remember_me, 
                  :title, :company, :description, :location, :full_name 

  validates_presence_of :company, :message => "can't be blank"
  validates_presence_of :title, :message => "can't be blank"
  # below validation commented out dince validateable already takes care of "email" field
  # validates_presence_of :email, :message => "can't be blank"
  
  validates_presence_of :full_name, :message => "can't be blank"
  validates_presence_of :phone_number, :message => "can't be blank"
  validates_length_of :phone_number, :within => 10..10, :message => "must be 10 digits"
  validates_format_of :phone_number, :with => /^[\d]+$/, :message => "must be digits only" 
  validates_uniqueness_of :phone_number, :on => :create, :message => "that number already taken"
  
  def apply_omniauth(omniauth)
    # TODO: set a default profile pic if user_info.image doesn't exist
    self.profile_pic = omniauth['user_info']['image'] if profile_pic.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super    
  end                                  
end
