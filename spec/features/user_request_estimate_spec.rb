require 'rails_helper'

feature "User request estimate" do
  scenario "successfully" do
    create(:user, name: "Bruno", email: "bruno@campuscode.com.br")
    category = create(:category, name: "Eletricista")
    create(:contractor, name: "Severino Eletricista", category: category)

    visit root_path
    click_on(category.name)
    click_on("Solicitar orçamento")

    fill_in "Descrição", with: "Instalar tomada 220V"
    fill_in "Local", with: "Morumbi"
    fill_in "Data desejada", with: "20/04/2019"
    select "Tarde", from: "Turno"
    attach_file 'Foto', Rails.root.join('spec', 'support', 'tomada.jpg')
    click_on 'Enviar'

    expect(page).to have_content("Orçamento solicitado com sucesso!")
    expect(page).to have_css('p', text: "Instalar tomada 220V")
    expect(page).to have_css('p', text: "Morumbi")
    expect(page).to have_css('p', text: "20/04/2019")
    expect(page).to have_css('p', text: "Tarde")

  end
end
