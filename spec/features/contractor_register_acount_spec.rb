require 'rails_helper'

feature 'User registers new contractor acount' do
  scenario 'succesfully' do
    
    Category.create(name: 'Amigo de aluguel')

    visit root_path
    click_on 'Novo prestador'
    fill_in 'Nome', with: 'Vinicius'
    fill_in 'E-mail', with: 'vinicius@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmar senha', with: '123456'
    fill_in 'CPF', with: '367.703.570-89'
    select 'Amigo de aluguel', from: 'Categoria'
    click_on 'Enviar'

    expect(current_path).to eq root_path
    expect(page).to have_css('h4', text: 'Bem vindo, Vinicius.')
    expect(page).to_not have_link('p', text: 'Entrar como prestador')
    expect(page).to have_css( 'p', text: 'Sair')

  end

  scenario 'and must fill all fields' do
    Category.create(name: 'Amigo de aluguel')

    visit root_path
    click_on 'Novo prestador'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirmar senha', with: ''
    fill_in 'CPF', with: ''
    select 'Amigo de aluguel', from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content("E-mail não pode ficar em branco" )
    expect(page).to have_content('E-mail')
    expect(page).to have_content('Nome')
    expect(page).to have_content('Senha')
    expect(page).to have_content('Confirmar senha')
    expect(page).to have_content('CPF')

  end

end
