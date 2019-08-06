FactoryBot.define do
  factory :todo do
    description { Faker::Lorem.word }
    created_by { Faker::Lorem.word }
  end
end
