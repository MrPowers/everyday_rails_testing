FactoryGirl.define do
  factory :phone_number do
    association :contact
    number { Faker::PhoneNumber.phone_number }
    
    factory :home_phone do
      phone_type "home"
    end

    factory :work_phone do
      phone_type "home"
    end

    factory :cell_phone do
      phone_type "home"
    end
  end
end