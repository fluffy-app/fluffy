# coding: utf-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:name => 'user1', :gender => 0, :age => 0)
User.create(:name => 'user2', :gender => 0, :age => 0)
User.create(:name => 'user3', :gender => 0, :age => 0)
User.create(:name => 'user4', :gender => 0, :age => 0)
User.create(:name => 'user5', :gender => 0, :age => 0)

Tag.create(:name => 'tag1')
Tag.create(:name => 'tag2')
Tag.create(:name => 'tag3')
Tag.create(:name => 'tag4')
Tag.create(:name => 'tag5')

Thing.create(:title => 'title1-1', :passion => 0, :user_id => 1)
Thing.create(:title => 'title2-1', :passion => 0, :user_id => 2)
Thing.create(:title => 'title3-1', :passion => 0, :user_id => 3)
Thing.create(:title => 'title4-1', :passion => 0, :user_id => 4)
Thing.create(:title => 'title5-1', :passion => 0, :user_id => 5)
Thing.create(:title => 'title1-2', :passion => 0, :user_id => 1)
Thing.create(:title => 'title2-2', :passion => 0, :user_id => 2)
Thing.create(:title => 'title3-2', :passion => 0, :user_id => 3)
Thing.create(:title => 'title4-2', :passion => 0, :user_id => 4)
Thing.create(:title => 'title5-2', :passion => 0, :user_id => 5)
Thing.create(:title => 'title1-3', :passion => 0, :user_id => 1)
Thing.create(:title => 'title2-3', :passion => 0, :user_id => 2)
Thing.create(:title => 'title3-3', :passion => 0, :user_id => 3)
Thing.create(:title => 'title4-3', :passion => 0, :user_id => 4)
Thing.create(:title => 'title5-3', :passion => 0, :user_id => 5)

ThingTag.create(:thing_id => 1, :tag_id => 1)
ThingTag.create(:thing_id => 2, :tag_id => 1)
ThingTag.create(:thing_id => 3, :tag_id => 1)
ThingTag.create(:thing_id => 4, :tag_id => 1)
ThingTag.create(:thing_id => 5, :tag_id => 1)
ThingTag.create(:thing_id => 6, :tag_id => 2)
ThingTag.create(:thing_id => 7, :tag_id => 2)
ThingTag.create(:thing_id => 8, :tag_id => 2)
ThingTag.create(:thing_id => 9, :tag_id => 2)
ThingTag.create(:thing_id => 10, :tag_id => 2)
ThingTag.create(:thing_id => 11, :tag_id => 3)
ThingTag.create(:thing_id => 12, :tag_id => 3)
ThingTag.create(:thing_id => 13, :tag_id => 3)
ThingTag.create(:thing_id => 14, :tag_id => 3)
ThingTag.create(:thing_id => 15, :tag_id => 3)

Post.create(:comment => 'post_kome', :thing_id => 1)
PostTag.create(:post_id => 1, :tag_id => 1)
Event.create(:name => 'evt_name', :thing_id => 1, :user_id => 1)
Chat.create(:comment => 'chat_kome', :thing_id => 1, :user_id => 1)
MeToo.create(:passion => 7, :thing_id => 1, :user_id => 1)
Favorite.create(:user_id => 1, :favorite_user_id => 2)

UserTag.create(:user_id => 1, :tag_id => 1)
UserTag.create(:user_id => 1, :tag_id => 2)
UserTag.create(:user_id => 1, :tag_id => 3)
