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

class ThingTag < ActiveRecord::Base
  belongs_to :thing, :foreign_key => :thing_id
  belongs_to :tag, :foreign_key => :tag_id
end
