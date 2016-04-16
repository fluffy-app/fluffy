# == Schema Information
#
# Table name: favorites
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  favorite_user_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_favorites_on_favorite_user_id  (favorite_user_id)
#  index_favorites_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_d15744e438  (user_id => users.id)
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite_user, class_name: 'User'
end
