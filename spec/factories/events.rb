FactoryGirl.define do
  factory :event do
    name "MyString"
    detail "MyText"
    schedule "2016-04-15"
    place "MyString"
    delete false
    close false
    thing nil
    user nil
  end
end
