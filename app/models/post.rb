# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  comment    :text(65535)
#  image_path :string(255)
#  thing_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_thing_id  (thing_id)
#
# Foreign Keys
#
#  fk_rails_1f90dd1ddb  (thing_id => things.id)
#

class Post < ActiveRecord::Base
  belongs_to :thing
  has_many :tags, :through => :post_tags
end
