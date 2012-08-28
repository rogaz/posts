class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  attr_accessible :name, :email, :password, :password_confirmation, :avatar, :admin
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "80x80>" }, :default_url => 'default.jpg'
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save {self.email.downcase!}

  validates :name, :presence => true, :length => {:within => 2..40}
  validates :email, :presence => true, :length => {:within => 5..30},
    :format => email_regex, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true, :length => {:within => 2..30}, :confirmation => true
  validates :password_confirmation, :presence => true
  default_scope :order => "users.name ASC"

  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::MD5
  end
end
