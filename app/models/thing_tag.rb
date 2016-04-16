# == Schema Information
#
# Table name: thing_tags
#
#  id         :integer          not null, primary key
#  thing_id   :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_thing_tags_on_tag_id    (tag_id)
#  index_thing_tags_on_thing_id  (thing_id)
#
# Foreign Keys
#
#  fk_rails_861d8b15e4  (tag_id => tags.id)
#  fk_rails_8ced5dddbb  (thing_id => things.id)
#

class ThingTag < ActiveRecord::Base
  belongs_to :thing
  belongs_to :tag
end
