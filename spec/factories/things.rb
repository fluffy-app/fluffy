FactoryGirl.define do
  factory :thing do
    title "MyString"
    passion 1
    schedule_date "2016-04-18"
    delete_flag false
    image_path "MyString"
    close_flag false
    association :user, factory: :user
  end

  factory :thing_user do
    title "MyString"
    passion 1
    schedule_date "2016-04-18"
    delete_flag false
    image_path "MyString"
    close_flag false
    association :user, factory: :user
  end

  factory :test_thing, class: Thing do
    title "test_title"
    passion 1
    schedule_date "2016-04-18"
    delete_flag false
    image_path "test_image_path"
    close_flag false
    association :user, factory: :user
  end

  trait :without_user do
    user nil
  end

  trait :with_user do
    association :user, factory: :user
  end

  trait :with_test_user do
    association :user, factory: :test_user
  end

  trait :with_test_user_name_change do
    association :user, factory: :test_user, name: "user_name_change"
  end
end
