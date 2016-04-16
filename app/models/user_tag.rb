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
# Foreign Keys
#
#  fk_rails_7156651ad8  (tag_id => tags.id)
#  fk_rails_ea0382482a  (user_id => users.id)
#

class UserTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
end
