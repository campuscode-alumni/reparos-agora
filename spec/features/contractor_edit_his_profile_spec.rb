require 'rails_helper'

feature 'Contractor edit his profile' do
  scenario 'successfully' do
    contractor = create(:contractor)
    create(:sub_category, name: 'Arrumar chuveiro', category: contractor.category) 
    create(:sub_category, name: 'Arrumar tomada', category: contractor.category) 
    create(:sub_category, name: 'Ar condicionado', category: contractor.category) 

    login_as contractor, scope: :contractor
    visit root_path
    click_on 'Perfil de prestador'
    fill_in 'Nome', with: 'Fulano'
    fill_in 'CPF', with: '582.205.910-48'
    fill_in 'Cidade', with: 'Campinas'
    check 'Arrumar chuveiro'
    check 'Arrumar tomada'
    click_on 'Atualizar'

    expect(current_path).to eq(contractor_path(contractor))
    expect(page).to have_content('Fulano')
    expect(page).to have_content('582.205.910-48')
    expect(page).to have_content('Campinas')
    expect(page).to have_content('Arrumar chuveiro')
    expect(page).to have_content('Arrumar tomada')
    expect(page).not_to have_content('Ar condicionado')
  end
end