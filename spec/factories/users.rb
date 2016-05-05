FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    image_path "MyString"
    background_image "MyString"
    gender 1
    age 1
    address "MyString"
    delete_flag false
  end

  factory :test_user, class: User do
    name "test_name"
    email "test_email"
    image_path "test_image_path"
    background_image "test_background_image"
    gender 1
    age 1
    address "test_address"
    delete_flag false
  end

  trait :with_thing do
    transient do
      things_count 5
    end
    after(:create) do |user, evaluator|
      create_list(:thing, evaluator.things_count, user: user)
    end
  end

end
