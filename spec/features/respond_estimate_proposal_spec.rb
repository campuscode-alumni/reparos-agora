require 'rails_helper'

feature 'Contractor responds estimate proposal' do
  scenario 'and sees list of estimates' do
    user = User.create(name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = Category.create!(name: 'Eletrica')
    contractor = Contractor.create!(name: 'Jao', category: category)
    estimate1 = Estimate.create!(contractor: contractor, user: user, description: 'Arrumar tomada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')
    estimate2 = Estimate.create!(contractor: contractor, user: user, description: 'Arrumar chuveiro', 
                               location: 'Avenida Faria Lima', service_date: '2019-03-15', day_shift: 'Tarde')

    visit root_path
    click_on 'Ver solicitações de orçamento'

    expect(page).to have_css('h4', text: estimate1.description)
    expect(page).to have_css('h4', text: estimate2.description)
  end

  scenario 'and view estimate details' do
    user = User.create!(name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = Category.create!(name: 'Eletrica')
    contractor = Contractor.create!(name: 'Jao', category: category)
    estimate = Estimate.create!(contractor: contractor, user: user, description: 'Arrumar tomada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    visit estimate_index_path
    click_on 'Arrumar tomada'

    expect(page).to have_css('h1', text: estimate.description)
    expect(page).to have_css('p', text: estimate.user.name)
    expect(page).to have_css('p', text: estimate.location)
    expect(page).to have_css('p', text: estimate.service_date)
    expect(page).to have_css('p', text: estimate.day_shift)
  end

  scenario 'and respond proposal' do
    user = User.create!(name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = Category.create!(name: 'Eletrica')
    contractor = Contractor.create!(name: 'Jao', category: category)
    estimate = Estimate.create!(contractor: contractor, user: user, description: 'Arrumar tomada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    visit estimate_index_path
    click_on 'Arrumar tomada'
    fill_in 'Tempo de execução', with: 2
    fill_in 'Lista de materiais', with: 'parafuso e fio'
    fill_in 'Custo de materiais', with: 3
    fill_in 'Taxa de visita', with: 5
    fill_in 'Custo do serviço', with: 50
    #fill_in 'Custos totais', with: 58
    click_on 'Enviar'
    
    expect(page).to have_css('p', text: 'Orçamento enviado')
  end

  scenario 'and must fill in all fields' do
    pending
  end

  scenario 'and unlogged user cant see estimate' do
    pending
  end

  scenario 'and different contractor cant see estimate' do
    pending
  end

  scenario 'and user cant see estimate' do
    pending
  end
end