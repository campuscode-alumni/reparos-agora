require 'rails_helper'

feature 'User creates account' do
  scenario 'successfully' do
    visit root_path
    click_on 'Criar conta de usuário'
    fill_in 'Nome', with: 'Carol'
    fill_in 'Email', with: 'carol@gmail.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Repita sua senha', with: '12345678'
    click_on 'Enviar'

   # expect(page).to have_css('h4', text: 'Bem-vindo, Carol!')
    expect(page).to have_content('Bem-vindo, Carol!')
  end

  scenario 'and the name is mandatory' do
    visit root_path
    click_on 'Criar conta de usuário'
    fill_in 'Nome', with: ''
    fill_in 'Email', with: 'carol@gmail.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Repita sua senha', with: '12345678'
    click_on 'Enviar'

    expect(page).to have_content("Name can't be blank")
  end
end