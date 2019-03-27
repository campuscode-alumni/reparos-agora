require 'rails_helper'

RSpec.describe Contractor, type: :model do
  describe '.update_average' do
    it 'should calculate contractors reviews average grades' do
      user = create(:user, name: 'João')
      contractor = create(:contractor, name: 'Vini')
      estimate = create(:estimate, user: user, contractor: contractor)
      estimate2 = create(:estimate, user: user, contractor: contractor)
      estimate3 = create(:estimate, user: user, contractor: contractor)
      service_order = create(:service_order, estimate: estimate)
      service_order2 = create(:service_order, estimate: estimate2)
      service_order3 = create(:service_order, estimate: estimate2)
      review_contractor1 = create(:review_contractor, grade: 2, comment: 'Péssimo serviço',
                                  service_order: service_order, contractor: contractor)
      review_contractor2 = create(:review_contractor, grade: 2, comment: 'Ótimo trabalho',
                                  service_order:service_order2, contractor: contractor)
      review_contractor3 = create(:review_contractor, grade: 5, comment: 'Ótimo trabalho',
                                  service_order:service_order2, contractor: contractor)

      average = Contractor.update_average(contractor)
      
      expect(average).to eq 3
    end

    it 'should return last grade if it is the first review' do
      user = create(:user, name: 'João')
      contractor = create(:contractor, name: 'Vini')
      estimate = create(:estimate, user: user, contractor: contractor)
      service_order = create(:service_order, estimate: estimate)
      review_contractor1 = create(:review_contractor, grade: 2, comment: 'Péssimo serviço',
                                  service_order: service_order, contractor: contractor)

      average = Contractor.update_average(contractor)
    
      expect(average).to eq 2
    end

    it 'should alert contractor if there are no reviews' do
      user = create(:user, name: 'João')
      contractor = create(:contractor, name: 'Vini')

      average = Contractor.update_average(contractor)
    
      expect(average).to eq nil
    end


  end
end
