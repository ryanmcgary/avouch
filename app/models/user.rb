class User < ActiveRecord::Base
  has_many :authentications, :foreign_key => "user_id", :dependent => :destroy
  has_many :recordings
  has_many :sites
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :phone_number, :remember_me, 
                  :title, :company, :description, :location, :full_name 
                  
                                    
end
