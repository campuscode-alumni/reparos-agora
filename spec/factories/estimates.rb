FactoryBot.define do
  factory :estimate do
    title { "MyString" }
    contractor 
    user 
    description { "MyText" }
    location { "MyString" }
    service_date { "2019-03-14 20:17:40" }
    day_shift { "MyString" }
  end
end
