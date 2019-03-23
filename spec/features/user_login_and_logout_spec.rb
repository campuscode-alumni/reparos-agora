require 'rails_helper'

feature 'User login' do
  scenario 'from homepage' do
    user = create(:user, name: 'Vini', email: 'vini@gmail.com', password: '123456')

    visit root_path
    click_on 'Entrar como usuário'
    fill_in 'E-mail', with: 'vini@gmail.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).to have_content('Sair')
    expect(page).not_to have_content('Entrar como usuário')
  end

  scenario 'and logout' do
    user = create(:user, name: 'Vini', email: 'vini@gmail.com', password: '123456')

    login_as user, scope: :user
    visit root_path
    click_on 'Sair'

    expect(page).not_to have_content('Sair')
    expect(page).to have_content('Entrar como usuário')
  end
end