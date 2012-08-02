class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
end
