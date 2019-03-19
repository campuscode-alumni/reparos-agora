require 'rails_helper'

feature 'Admin register category' do
  scenario 'succesfully' do
    user = create(:user, email: 'email@email.com', password: '123456')

    login_as user, :scope => :user

    visit root_path

    click_on 'Nova categoria'

    fill_in 'Nome', with: 'Eletricista'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Eletricista')
    expect(page).to have_css('h1', text: 'Categoria cadastrada com sucesso.')
  end
end
