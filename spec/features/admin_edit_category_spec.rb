require 'rails_helper'

feature 'Admin edit category' do
  scenario 'successfully' do
    user = create(:user, email: 'email@email.com', password: '123456')
    category = create(:category)

    visit root_path
    click_on category.name
    click_on 'Editar'
    fill_in 'Nome', with: 'Eletricista'
    click_on 'Enviar'

    expect(page).to have_content('Eletricista')
  end

  scenario 'and name is mandatory' do
    user = create(:user, email: 'email@email.com', password: '123456')
    category = create(:category)

    visit root_path
    click_on category.name
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('É necessário preencher todos os campos!')
  end
end