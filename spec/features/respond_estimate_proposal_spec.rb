require 'rails_helper'


feature 'Contractor responds estimate proposal' do
  scenario 'and sees list of estimates' do
    user = create(:user, name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = create(:category, name: 'Eletrica')
    contractor = create(:contractor, name: 'Jao', category: category)
    estimate1 = create(:estimate, title: 'Arrumar tomada', contractor: contractor, user: user, description: 'Arrumar tomada quebrada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')
    estimate2 = create(:estimate, contractor: contractor, user: user, description: 'Arrumar chuveiro', 
                               location: 'Avenida Faria Lima', service_date: '2019-03-15', day_shift: 'Tarde')

    login_as contractor, scope: :contractor
    visit root_path
    click_on 'Ver solicitações de orçamento'

    expect(page).to have_css('h4', text: 'Arrumar tomada')
    expect(page).to have_css('h4', text: estimate2.title)
  end

  scenario 'and view estimate details' do
    user = create(:user, name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = create(:category, name: 'Eletrica')
    contractor = create(:contractor, name: 'Jao', category: category)
    estimate = create(:estimate, title: 'Arrumar tomada', contractor: contractor, user: user, description: 'Arrumar tomada quebrada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    login_as contractor, scope: :contractor                            
    visit estimates_path
    click_on 'Arrumar tomada'

    expect(page).to have_css('h1', text: estimate.title)
    expect(page).to have_css('p', text: estimate.description)
    expect(page).to have_css('p', text: estimate.location)
    expect(page).to have_css('p', text: estimate.service_date.strftime('%d/%m/%Y'))
    expect(page).to have_css('p', text: estimate.day_shift)
    expect(page).to have_css('p', text: estimate.user.name)
    expect(page).to have_css('p', text: estimate.contractor.name)
  end

  scenario 'and respond proposal' do
    user = create(:user, name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = create(:category, name: 'Eletrica')
    contractor = create(:contractor, name: 'Jao', category: category)
    estimate = create(:estimate, title: 'Arrumar tomada', contractor: contractor, user: user, description: 'Arrumar tomada quebrada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    login_as contractor, scope: :contractor                              
    visit estimates_path
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
    user = create(:user, name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = create(:category, name: 'Eletrica')
    contractor = create(:contractor, name: 'Jao', category: category)
    estimate = create(:estimate, title: 'Arrumar tomada', contractor: contractor, user: user, description: 'Arrumar tomada quebrada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    login_as contractor, scope: :contractor   
    visit estimates_path
    click_on 'Arrumar tomada'
    fill_in 'Tempo de execução', with: ''
    fill_in 'Lista de materiais', with: ''
    fill_in 'Custo de materiais', with: ''
    fill_in 'Taxa de visita', with: ''
    fill_in 'Custo do serviço', with: ''
    #fill_in 'Custos totais', with: 58
    click_on 'Enviar'
    
    expect(page).to have_css('p', text: 'Não foi possivel salvar')
  end

  scenario 'and unlogged user cant see estimate' do
    user = create(:user, name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = create(:category, name: 'Eletrica')
    contractor = create(:contractor, name: 'Jao', category: category)
    estimate = create(:estimate, title: 'Arrumar tomada', contractor: contractor, user: user, description: 'Arrumar tomada quebrada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    visit estimate_path(estimate)
    
    expect(current_path).to eq root_path
  end

  scenario 'and different contractor cant see estimate' do
    user = create(:user, name: 'Zé', email: "ze@gmail.com", password: '123456')
    category = create(:category, name: 'Eletrica')
    contractor = create(:contractor, name: 'Jao', category: category)
    contractor1 = create(:contractor, name: 'Ze', category: category)
    estimate = create(:estimate, title: 'Arrumar tomada', contractor: contractor, user: user, description: 'Arrumar tomada quebrada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    login_as contractor1, scope: :contractor
    visit estimate_path(estimate)

    expect(page).not_to have_css('h1', text: estimate.title)
  end

  scenario 'and different user cant see estimate' do
    user = create(:user, name: 'Zé', email: "ze@gmail.com", password: '123456')
    user2 = create(:user, name: 'Zé', email: "zezin@gmail.com", password: '123456')
    category = create(:category, name: 'Eletrica')
    contractor = create(:contractor, name: 'Jao', category: category)
    estimate = create(:estimate, title: 'Arrumar tomada', contractor: contractor, user: user, description: 'Arrumar tomada quebrada', 
                               location: 'Avenida Paulista', service_date: '2019-03-15', day_shift: 'Noite')

    login_as user2, scope: :user
    visit estimate_path(estimate)

    expect(page).not_to have_css('h1', text: estimate.title)
  end
end