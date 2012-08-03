class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :admin

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save {self.email.downcase!}

  validates :name, :presence => true, :length => {:within => 2..40}
  validates :email, :presence => true, :length => {:within => 5..30},
    :format => email_regex, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true, :length => {:within => 2..10}, :confirmation => true
  validates :password_confirmation, :presence => true
  default_scope :order => "users.name ASC"

  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::MD5
  end

end