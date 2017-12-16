class User < ActiveRecord::Base
  has_secure_password
  
  
  has_many :playlist, dependent: :destroy
  has_many :songs, through: :playlists, source: :song
  

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email,
   uniqueness: { case_sensitive: false }, 
   presence: true,
   format: {with: email_regex}
   

  before_save :setcase

  def setcase
  	self.first_name.downcase!
  	self.last_name.downcase!
  	self.email.downcase!
  end
end

