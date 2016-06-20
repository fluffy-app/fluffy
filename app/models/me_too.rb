# == Schema Information
#
# Table name: me_toos
#
#  id            :integer          not null, primary key
#  passion       :integer
#  accepted_flag :boolean
#  delete_flag   :boolean
#  thing_id      :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_me_toos_on_thing_id  (thing_id)
#  index_me_toos_on_user_id   (user_id)
#

class MeToo < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
