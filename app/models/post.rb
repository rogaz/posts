class Post < ActiveRecord::Base
  attr_accessible :estado
  belongs_to :user

  validates :estado, :presence => true, :length => {:maximum => 140}
  validates :user_id, :presence => true
  default_scope :order => 'posts.created_at DESC'
end
