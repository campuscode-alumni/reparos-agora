require 'rails_helper'

feature 'User creates account' do
  scenario 'successfully' do
    visit root_path
    click_on 'Criar conta de usuário'
    fill_in 'Nome', with: 'Carol'
    fill_in 'E-mail', with: 'carol@gmail.com'
    fill_in 'CPF', with: '12345678910'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar senha', with: '12345678'
    click_on 'Enviar'

   # expect(page).to have_css('h4', text: 'Bem-vindo, Carol!')
    expect(page).to have_content('Bem-vindo, Carol!')
  end

  scenario 'and the name is mandatory' do
    visit root_path
    click_on 'Criar conta de usuário'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: 'carol@gmail.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'CPF', with: '12345678910'
    fill_in 'Confirmar senha', with: '12345678'
    click_on 'Enviar'

    expect(page).to have_content("Nome não pode ficar em branco")
  end
end