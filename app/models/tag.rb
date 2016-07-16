# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  has_many :user_tags, :foreign_key => :tag_id, :primary_key => :id
  has_many :users, :through => :user_tags
  has_many :thing_tags, :foreign_key => :tag_id, :primary_key => :id
  has_many :things, :through => :thing_tags
  has_many :post_tags, :foreign_key => :tag_id, :primary_key => :id
  has_many :posts, :through => :post_tags

  # 内部結合 thing_tags
  scope :with_thing_tags, lambda {
    joins(:thing_tags)
  }

  # 内部結合 thing_tags、things
  scope :with_things, lambda {
    joins(:things)
  }

  # 外部結合 things
  # joinsと組合せると内部結合した上で結合先テーブルも取得する
  scope :with_things_eager_load, lambda {
    eager_load(:things)
  }

end
