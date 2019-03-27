FactoryBot.define do
  factory :review_contractor do
    grade { 1 }
    comment { "MyText" }
    service_order { nil }
  end
end
