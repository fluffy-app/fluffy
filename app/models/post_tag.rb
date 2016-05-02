# == Schema Information
#
# Table name: post_tags
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_tags_on_post_id  (post_id)
#  index_post_tags_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  fk_rails_c9d8c5063e  (tag_id => tags.id)
#  fk_rails_fdf74b486b  (post_id => posts.id)
#

class PostTag < ActiveRecord::Base
  belongs_to :post, :foreign_key => :post_id
  belongs_to :tag, :foreign_key => :tag_id
end
