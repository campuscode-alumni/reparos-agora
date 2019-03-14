FactoryBot.define do
  factory :contractor do
    name { "MyString" }
    sequence(:email) { |n| "joao#{n}@gmail.com" }
    category
    password { "12345678" }
    cpf { "367.703.570-89" }
  end
end
