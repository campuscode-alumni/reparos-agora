require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#update_average' do
    it 'should calculate with zero reviews' do
      user = create(:user)
      
      user.update_average()

      expect(user.average_rating).to eq 0
    end

    it 'should calculate with 2 reviews' do
      user = create(:user)
      contractor = create(:contractor, name: 'Vinicius', email: 'vini@email.com')
      estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro')
      os = create(:service_order, estimate: estimate)
      user_review1 = create(:user_review, service_order: os, user: user, score: 5)
      user_review2 = create(:user_review, service_order: os, user: user, score: 5)

      user.update_average()

      expect(user.average_rating).to eq 5
    end

    it 'should calculate with 2 reviews' do
      user = create(:user)
      contractor = create(:contractor, name: 'Vinicius', email: 'vini@email.com')
      estimate = create(:estimate, user: user, contractor: contractor, title: 'Instalação de chuveiro')
      os = create(:service_order, estimate: estimate)
      user_review1 = create(:user_review, service_order: os, user: user, score: 5)
      user_review2 = create(:user_review, service_order: os, user: user, score: 0)

      user.update_average()

      expect(user.average_rating).to eq 2.5
    end
  end
end
