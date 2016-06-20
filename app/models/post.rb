# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  comment    :text
#  image_path :string
#  thing_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_thing_id  (thing_id)
#

class Post < ActiveRecord::Base
  belongs_to :thing
  has_many :post_tags, :foreign_key => :post_id, :primary_key => :id
  has_many :tags, :through => :post_tags
end
