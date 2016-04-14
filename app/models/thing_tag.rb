class ThingTag < ActiveRecord::Base
  belongs_to :thing
  belongs_to :tag
end
