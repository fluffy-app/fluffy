class Post < ActiveRecord::Base
  belongs_to :thing
  has_many :tags, :through => :post_tags
end
