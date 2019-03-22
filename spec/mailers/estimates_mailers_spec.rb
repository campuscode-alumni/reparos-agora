require 'rails_helper'

RSpec.describe EstimatesMailer do
  describe '.notify_answered_estimate' do
    it 'should notify user of ansewered estimate' do
      user = create(:user, name: 'João', email: 'joao@email.com', password: '123456' )
      contractor = create(:contractor, name: 'Vini', email: 'vini@email.com',
                                       password: '123456')
      estimate = create(:estimate, user: user, title: 'Instalação de chuveiro', 
                                   description: 'Instalação de chuveiro marca Z', 
                                   location: 'Morumbi', 
                                   service_date: '2019-03-14 20:17:40', 
                                   day_shift: 'Manhã')
      
      mail = EstimatesMailer.notify_answered_estimate(estimate.id, user.email)

      expect(mail.to).to eq ([user.email])
      expect(mail.subject).to have_content("Orçamento Realizado: #{estimate.title}")
      expect(mail.body).to have_content(estimate.description)
      expect(mail.body).to have_content(estimate.total_fee)

    end
  end

  describe '.notify_approved' do
    it 'should notify contractor of approved estimate' do
      
      user = create(:user, name: 'João', email: 'joao@email.com', password: '123456' )
      contractor = create(:contractor, name: 'Vini', email: 'vini@email.com',
                                       password: '123456')
      estimate = create(:estimate, user: user, title: 'Instalação de chuveiro', 
                                   description: 'Instalação de chuveiro marca Z', 
                                   location: 'Morumbi', 
                                   service_date: '2019-03-14 20:17:40', 
                                   day_shift: 'Manhã')

      mail = EstimatesMailer.notify_approved(estimate.id, contractor.email)

      expect(mail.to).to eq ([contractor.email])
      expect(mail.subject).to have_content("Orçamento aprovado: #{estimate.title}")
      expect(mail.body).to have_content(estimate.description)

    end
  end
end
