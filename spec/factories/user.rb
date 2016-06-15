FactoryGirl.define do

  factory :user do

    password "password"
    email "pomopro@test.com"

    after(:build) { |user| user.class.skip_callback(:create, :after, :send_welcome_mail)   }
  end
end
