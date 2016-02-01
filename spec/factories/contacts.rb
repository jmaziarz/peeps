FactoryGirl.define do
  factory :contact do
    name_first { Faker::Name.first_name }
    name_last { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
