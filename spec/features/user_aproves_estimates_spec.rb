require 'rails_helper'

feature 'User aproves estimates' do
  scenario 'Succesfully' do
    user = create(:user, name: 'Andre' )
    category = create(:category, name: 'Encanador')
    contractor = create(:contractor, name: 'Vinicius')
    estimate = create(:estimate, user: user, contractor: contractor)
  end
end