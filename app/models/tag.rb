class Tag < ActiveRecord::Base
  has_many :users, :through => :user_tags
  has_many :things, :through => :thing_tags
  has_many :posts, :through => :post_tags
end
