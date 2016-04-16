# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  detail     :text(65535)
#  schedule   :date
#  place      :string(255)
#  delete     :boolean
#  close      :boolean
#  thing_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_events_on_thing_id  (thing_id)
#  index_events_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_0cb5590091  (user_id => users.id)
#  fk_rails_db6b227226  (thing_id => things.id)
#

class Event < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
