require 'rails_helper'

feature 'Contractor edits account details' do
  scenario 'successfully' do
    category1 = Category.create!(name: 'Eletricista')
    category2 = Category.create!(name: 'Marceneiro')
    contractor = Contractor.create!(name: 'Vinicius', email: 'vini@email.com', password: '123456',
                                    cpf: '367.703.570-89', category: category1)

    login_as contractor, :scope => :contractor

    visit root_path
    click_on 'Perfil de prestador'
    click_on 'Editar perfil'

    fill_in 'Nome', with: 'Vitor'
    select 'Marceneiro', from: 'Categorias'
    click_on 'Atualizar'

    contractor.reload

    expect(current_path).to eq contractor_path(contractor.id)
    expect(contractor.name).to eq 'Vitor'
    expect(contractor.category.name).to eq 'Marceneiro'
    expect(page).to have_content('Vitor')
    expect(page).to have_content('Marceneiro')

  end

  scenario 'and must fill all fields' do
    category1 = Category.create!(name: 'Eletricista')
    contractor = Contractor.create!(name: 'Vinicius', email: 'vini@email.com', password: '123456',
                                    cpf: '367.703.570-89', category: category1)

    login_as contractor, :scope => :contractor

    visit root_path
    click_on 'Perfil de prestador'
    click_on 'Editar perfil'

    fill_in 'Nome', with: ''
    click_on 'Atualizar'

    expect(page).to have_content('Não foi possível atualizar o perfil')

  end


end
