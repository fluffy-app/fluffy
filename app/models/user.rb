# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  image_path       :string(255)
#  background_image :string(255)
#  gender           :integer
#  age              :integer
#  address          :string(255)
#  delete           :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  has_many :things
  has_many :events
  has_many :chats
  has_many :me_toos
  has_many :favorites
  has_many :tags, :through => :user_tags
end
