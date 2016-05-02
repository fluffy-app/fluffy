# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  image_path       :string(255)
#  background_image :string(255)
#  gender           :integer
#  age              :integer
#  address          :string(255)
#  delete_flag      :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  has_many :things
  has_many :events
  has_many :chats
  has_many :me_toos
  has_many :favorites
  has_many :user_tags, :foreign_key => :user_id, :primary_key => :id
  has_many :tags, :through => :user_tags

  # 内部結合 things
  scope :with_things, lambda {
    joins(:things)
  }

  # 内部結合 user_tags
  scope :with_user_tags, lambda {
    joins(:user_tags)
  }

  # 内部結合 tags
  scope :with_tags, lambda {
    joins(:tags)
  }

end
