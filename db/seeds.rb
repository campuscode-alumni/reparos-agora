# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: 'Vini', email: 'vini@email.com', password: '123456')
User.create!(name: 'Henrique', email: 'henrique@email.com', password: '123456')
category1 = Category.create(name: 'Eletricista')
category2 = Category.create(name: 'Marceneiro')
contractor = Contractor.create!(name: 'Luis', email: 'luis@email.com', password: '123456', category: category1)
Contractor.create!(name: 'Bruno', email: 'bruno@email.com', password: '123456', category: category1)
Contractor.create!(name: 'Felipe', email: 'felipe@email.com', password: '123456', category: category2)
Contractor.create!(name: 'Andre', email: 'andre@email.com', password: '123456', category: category2)
Estimate.create!(title: 'Instalação de rede da casa', description: 'Alugando casa nova',
                 location: 'Morumbi', service_date: '2019-04-23 20:00:00', 
                 day_shift: 'Manhã', total_hours: '5', material_list: 'Vários trecos', 
                 material_fee: '12', visit_fee: '123', service_fee: '1234', user: user, contractor: contractor)