FactoryGirl.define do
  factory :event do
    name "MyString"
    detail "MyText"
    schedule_date "2016-04-18"
    place "MyString"
    delete_flag false
    close_flag false
    thing nil
    user nil
  end
end
