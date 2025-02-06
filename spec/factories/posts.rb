FactoryBot.define do
  factory :post do
    title { "沖縄旅行" }
    body { "沖縄旅行、最高でした。" }
    location { "沖縄" }
    association :user
  end
end
