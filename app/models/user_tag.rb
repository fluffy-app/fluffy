# == Schema Information
#
# Table name: user_tags
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_tags_on_tag_id   (tag_id)
#  index_user_tags_on_user_id  (user_id)
#

class UserTag < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :tag, :foreign_key => :tag_id
end
