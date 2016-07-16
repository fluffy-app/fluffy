# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  name          :string
#  detail        :text
#  schedule_date :date
#  place         :string
#  delete_flag   :boolean
#  close_flag    :boolean
#  thing_id      :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_events_on_thing_id  (thing_id)
#  index_events_on_user_id   (user_id)
#

class Event < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
