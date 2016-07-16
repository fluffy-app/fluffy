# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string
#  email            :string
#  image_path       :string
#  background_image :string
#  gender           :integer
#  age              :integer
#  address          :string
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
  # 単独で使用した場合は結合先テーブルは取得しない
  scope :with_things, lambda {
    joins(:things)
  }

  # 外部結合 things
  # joinsと組合せると内部結合した上で結合先テーブルも取得する
  scope :with_things_eager_load, lambda {
    eager_load(:things)
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
