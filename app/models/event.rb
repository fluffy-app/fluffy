class Event < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
end
