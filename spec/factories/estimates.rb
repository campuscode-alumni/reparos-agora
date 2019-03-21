FactoryBot.define do
  factory :estimate do
    contractor 
    user 
    title { "Título padrão" }
    description { "Descrição padrão" }
    location { "Casa da sogra" }
    service_date { "2019-03-14 20:17:40" }
    day_shift { "Manhã" }
    total_hours { "MyString" }
    material_list { "MyString" } 
    material_fee { "MyString" }
    visit_fee { "MyString" }
    service_fee { "MyString" }
  end
end
