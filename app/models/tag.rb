# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
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
end
