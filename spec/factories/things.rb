FactoryGirl.define do
  factory :thing do
    title "MyString"
    passion 1
    schedule_date "2016-04-18"
    delete_flag false
    image_path "MyString"
    close_flag false
    user nil
  end
end
