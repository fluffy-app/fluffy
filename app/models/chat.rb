# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  comment    :text
#  thing_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_chats_on_thing_id  (thing_id)
#  index_chats_on_user_id   (user_id)
#

class Chat < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
