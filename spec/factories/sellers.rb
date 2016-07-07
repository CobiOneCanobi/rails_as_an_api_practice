FactoryGirl.define do
  factory :seller do
    name { Faker::StarWars.character  }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
