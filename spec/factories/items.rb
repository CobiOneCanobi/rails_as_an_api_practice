FactoryGirl.define do
  factory :item do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(3) }
    category { Category.offset(rand(Category.count)).first }
    price { Faker::Commerce.price }
    status { Status.offset(rand(Status.count)).first }
    requirements { Faker::Lorem.paragraph(3) }
    published_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
  end
end
