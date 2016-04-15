class Thing < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :chats
  has_many :posts
  has_many :me_toos
  has_many :tags, :through => :thing_tags
end
