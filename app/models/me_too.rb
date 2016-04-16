# == Schema Information
#
# Table name: me_toos
#
#  id         :integer          not null, primary key
#  passion    :integer
#  accepted   :boolean
#  delete     :boolean
#  thing_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_me_toos_on_thing_id  (thing_id)
#  index_me_toos_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_039813a9d5  (thing_id => things.id)
#  fk_rails_56f8015a4f  (user_id => users.id)
#

class MeToo < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
