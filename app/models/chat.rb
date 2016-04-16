# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  comment    :text(65535)
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
# Foreign Keys
#
#  fk_rails_736fa61d16  (thing_id => things.id)
#  fk_rails_e555f43151  (user_id => users.id)
#

class Chat < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
