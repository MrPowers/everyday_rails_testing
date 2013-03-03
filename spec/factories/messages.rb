FactoryGirl.define do
  factory :message do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    message { Faker::Lorem.paragraph }

    factory :invalid_message do
      email nil
    end
  end
end