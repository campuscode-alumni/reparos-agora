require 'rails_helper'

feature 'User review a contractor' do
  scenario 'successfully' do
    #arrange
    user = create(:user, name: 'Vini')
    contractor = create(:contractor, name: 'Vini Eletricista')
    estimate = create(:estimate, title: 'Arrumar tomada', user: user, contractor: contractor)
    os = ServiceOrder.create(estimate: estimate)

    #act
    login_as user, scope: :user
    visit service_order_path(os)
    click_on 'Avaliar Prestador'
    select '4', from: 'Nota'
    fill_in 'Comentário', with: 'O Vini é um cara bem legal.'
    click_on 'Avaliar'

    #asserts
    expect(current_path).to eq contractor_path(contractor)
    expect(page).to have_content('Média das avaliações: 4')
    expect(page).to have_content('Avaliação: 4')
    expect(page).to have_content('O Vini é um cara bem legal.')

  end

end
