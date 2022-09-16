FactoryBot.define do
  factory :tea do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
    temperature { Faker::Lorem.word }
    brew_time { Faker::Lorem.word }
  end
end
