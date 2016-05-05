# == Schema Information
#
# Table name: things
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  passion       :integer
#  schedule_date :date
#  delete_flag   :boolean
#  image_path    :string(255)
#  close_flag    :boolean
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_things_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_b9af16ffb5  (user_id => users.id)
#

class Thing < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :chats
  has_many :posts
  has_many :me_toos
  has_many :thing_tags, :foreign_key => :thing_id, :primary_key => :id
  has_many :tags, :through => :thing_tags

  validates :user_id, presence: true

  # 内部結合 user
  scope :with_user, lambda {
    joins(:user)
  }

  # 外部結合 user
  # joinsと組合せると内部結合した上で結合先テーブルも取得する
  scope :with_user_eager_load, lambda {
    eager_load(:user)
  }

  # 内部結合 thing_tags
  scope :with_thing_tags, lambda {
    joins(:thing_tags)
  }

  # 内部結合 thing_tags、tags
  scope :with_tags, lambda {
    joins(:tags)
  }

  # 外部結合 tags
  # joinsと組合せると内部結合した上で結合先テーブルも取得する
  scope :with_tags_eager_load, lambda {
    eager_load(:tags)
  }

  scope :latest, lambda {
    order(created_at: :desc)
  }

  scope :oldest, lambda {
    order(created_at: :asc)
  }

end
