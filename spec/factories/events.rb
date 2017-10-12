FactoryGirl.define do
  factory :event do
    name              { Faker::Name.name }
    description       { Faker::Lorem.sentence(40) }
    location           { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          50
    includes_food     true
    includes_drink    true
    starts_at         { Date.today }
    ends_at           { Date.today + 2.days }


    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
