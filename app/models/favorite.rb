class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite_user, class_name: 'User'
end
