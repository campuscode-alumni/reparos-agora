require 'rails_helper'

feature 'Contractor logs in' do
  scenario 'successfully' do

    contractor = create(:contractor, name: 'Prestador', email: 'prestador@email.com', password: '123456')

    visit root_path
    click_on 'Entrar como prestador'
    fill_in 'E-mail', with: 'prestador@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Bem vindo, Prestador.')

  end

  scenario 'and logs out' do

    contractor = create(:contractor, name: 'Prestador', email: 'prestador@email.com', password: '123456')
    
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Sair'

    expect(current_path). to eq root_path
    expect(page).not_to have_content('Bem vindo, Prestador.')

  end

end
