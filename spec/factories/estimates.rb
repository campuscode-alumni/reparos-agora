FactoryBot.define do
  factory :estimate do
    title { "MyString" }
    contractor 
    user 
    description { "MyText" }
    location { "MyString" }
    service_date { "2019-03-14 20:17:40" }
    day_shift { "MyString" }
    total_hours { "MyString" }
    material_list { "MyString" } 
    material_fee { "MyString" }
    visit_fee { "MyString" }
    service_fee { "MyString" }
  end
end
