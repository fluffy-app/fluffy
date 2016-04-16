# == Schema Information
#
# Table name: things
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  passion    :integer
#  schedule   :date
#  delete     :boolean
#  image_path :string(255)
#  close      :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_things_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_b9af16ffb5  (user_id => users.id)
#

class Thing < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :chats
  has_many :posts
  has_many :me_toos
  has_many :tags, :through => :thing_tags
end
