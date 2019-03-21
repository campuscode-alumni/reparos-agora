require 'rails_helper'

feature 'User aproves estimates' do
  scenario 'Succesfully' do
    user = create(:user, name: 'Andre', email: 'andre@email.com', password:'123456')
    category = create(:category, name: 'Encanador')
    contractor = create(:contractor, name: 'Vinicius')
    estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro')
    

    login_as user, :scope => :user
    
    visit root_path

    click_on 'Meus orçamentos'
    click_on 'Instalação de chuveiro'
    save_page
    click_on 'Aprovar' 

    estimate.reload

    expect(current_path).to eq estimate_path(estimate.id)
    expect(estimate.approved).to eq true
    expect(page).to have_css('h1', text: 'Instalação de chuveiro')
    expect(page).to have_css('h2', text: 'Orçamento aprovado')  
  
  end
  scenario 'views pending estimates' do
    user = create(:user, name: 'Andre', email: 'andre@email.com', password:'123456')
    category = create(:category, name: 'Encanador')
    contractor = create(:contractor, name: 'Vinicius')
    estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro')
    
    login_as user, :scope => :user
    
    visit root_path

    click_on 'Meus orçamentos'
    click_on 'Instalação de chuveiro'

    expect(current_path).to eq estimate_path(estimate.id)
    expect(estimate.approved).to eq nil
    expect(page).to have_css('h1', text: 'Instalação de chuveiro')
    expect(page).to have_css('h2', text: 'Orçamento não avaliado')
    
  end

  scenario 'and cant see Approve button for approved estimates' do
    user = create(:user, name: 'Andre', email: 'andre@email.com', password:'123456')
    category = create(:category, name: 'Encanador')
    contractor = create(:contractor, name: 'Vinicius')
    estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro', approved: true)
  
    login_as user, :scope => :user
    
    visit root_path

    click_on 'Meus orçamentos'
    click_on 'Instalação de chuveiro'

    expect(current_path).to eq estimate_path(estimate.id)
    expect(estimate.approved).to eq true
    expect(page).to have_css('h1', text: 'Instalação de chuveiro')
    expect(page).to have_css('h2', text: 'Orçamento aprovado')
    expect(page).not_to have_css('p', text: 'Aprovar')

  end
end