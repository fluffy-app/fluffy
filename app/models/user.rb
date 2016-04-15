class User < ActiveRecord::Base
  has_many :things
  has_many :events
  has_many :chats
  has_many :me_toos
  has_many :favorites
  has_many :tags, :through => :user_tags
end
