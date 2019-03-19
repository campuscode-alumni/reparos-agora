FactoryBot.define do
  factory :estimate do
    title { "MyString" }
    contractor 
    user 
    title { "Título padrão" }
    description { "Descrição padrão" }
    location { "Casa da sogra" }
    service_date { "2019-03-14 20:17:40" }
    day_shift { "Manhã" }
  end
end
