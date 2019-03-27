require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#update_average' do
    it 'should calculate with zero reviews' do
      user = create(:user)
      
      user.update_average()

      expect(user.average_rating).to eq 0
    end
  end
end
