require 'rails_helper'

feature 'Contractor review user' do
  scenario 'successfully' do
    user = create(:user, name: 'Andre', email: 'andre@email.com', password:'123456')
    category = create(:category, name: 'Encanador')
    contractor = create(:contractor, name: 'Vinicius', email: 'vini@email.com')
    estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro')
    os = create(:service_order, estimate: estimate)

    login_as contractor, scope: :contractor
    visit service_order_path(os)
    click_on 'Avaliar usuário'
    select '5', from: 'Nota'
    fill_in 'Comentário', with: 'Pontual e educado. Recomendo.'
    click_on 'Enviar'

    expect(current_path).to eq user_path(user)
    expect(page).to have_content('5')
    expect(page).to have_content('Pontual e educado. Recomendo.')
  end

  scenario 'and update average rating' do
    user = create(:user, name: 'Andre', email: 'andre@email.com', password:'123456')
    category = create(:category, name: 'Encanador')
    contractor = create(:contractor, name: 'Vinicius', email: 'vini@email.com')
    estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro')
    os = create(:service_order, estimate: estimate)
    user_review1 = create(:user_review, service_order: os, user: user, score: 5)

    login_as contractor, scope: :contractor
    visit service_order_path(os)
    click_on 'Avaliar usuário'
    select '0', from: 'Nota'
    fill_in 'Comentário', with: 'Péssimo, não recomendo.'
    click_on 'Enviar'

    expect(current_path).to eq user_path(user)
    expect(page).to have_content('0')
    expect(page).to have_content('Péssimo, não recomendo.')
    expect(page).to have_content(2.5)
  end
end