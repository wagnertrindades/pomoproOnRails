FactoryGirl.define do

  factory :timer, class: 'Timer' do

    status "pomo"
    association :user, factory: :user

  end
end
