require 'rails_helper'

feature 'Notify contractor estimate approved' do
  scenario 'succesfully' do
    user = create(:user, name: 'Andre', email: 'andre@email.com', password:'123456')
    category = create(:category, name: 'Encanador')
    contractor = create(:contractor, name: 'Vinicius', email: 'vini@email.com')
    estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro')
    mailer_spy = class_spy(EstimatesMailer)
    stub_const('EstimatesMailer', mailer_spy)

    login_as user, scope: :user
    
    visit estimate_path(estimate)

    click_on 'Aprovar'

    expect(EstimatesMailer).to have_received(:notify_approved).with(estimate.id, 'vini@email.com')
    expect(page).to have_content('Prestador de serviço será notificado')
  end
end
