require 'rails_helper'

feature "User request estimate" do
  scenario "successfully" do
    #Arrange
    user = create(:user, name: "Bruno", email: "bruno@campuscode.com.br")
    category = create(:category, name: "Eletricista")
    create(:contractor, name: "Severino Eletricista", category: category)
    
    #Act
    login_as(user, scope: :user)
    visit root_path
    click_on(category.name)
    click_on("Solicitar orçamento")

    fill_in "Título", with: "Instalação de Tomada"
    fill_in "Descrição", with: "Instalar tomada 220V na área de serviço"
    fill_in "Local", with: "Morumbi"
    fill_in "Data desejada", with: "20/04/2019"
    select "Tarde", from: "Turno"
    attach_file 'Foto', Rails.root.join('spec', 'support', 'tomada.jpg')
    click_on 'Enviar'

    #Assert
    expect(page).to have_content("Orçamento solicitado com sucesso!")
    expect(current_path).to eq estimate_path(Estimate.last)
    expect(page).to have_css('h1', text: "Instalação de Tomada")
    expect(page).to have_css('p', text: "Instalar tomada 220V na área de serviço")
    expect(page).to have_css('p', text: "Morumbi")
    expect(page).to have_css('p', text: "20/04/2019")
    expect(page).to have_css('p', text: "Tarde")
    expect(page).to have_css('img[src*="tomada.jpg"]')
  end

  scenario 'and must be logged in' do
    #Arrange
    category = create(:category, name: "Eletricista")
    contractor = create(:contractor, name: "Severino Eletricista", category: category)

    #Act
    visit new_contractor_estimate_path(contractor)

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  scenario "and can't see another user's estimates" do
    #Arrange
    user1 = create(:user, name: "Bruno", email: "bruno@campuscode.com.br")
    user2 = create(:user, name: 'Vini', email: 'vinimachado00@gmail.com')
    category = create(:category, name: "Eletricista")
    contractor = create(:contractor, name: "Severino Eletricista", category: category)
    estimate = create(:estimate, title: 'Instalação de tomada', user: user1, contractor: contractor)
    estimate.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'tomada.jpg')), filename: 'tomada.jpg')

    #Act
    login_as(user2, scope: :user)
    visit estimate_path(estimate)

    #Assert
    expect(page).to have_content('Não é possível acessar este orçamento')
    expect(page).not_to have_css('h1', text: 'Instalação de tomada')
  end

  scenario "and can't request an estimate as contractor" do
    #Arrange
    category = create(:category, name: "Eletricista")
    contractor = create(:contractor, email: 'severino@gmail.com', category: category)

    #Act
    login_as(contractor, scope: :contractor)
    visit root_path
    click_on(category.name)

    #Assert
    expect(page).not_to have_link('Solicitar orçamento')
  end
end
