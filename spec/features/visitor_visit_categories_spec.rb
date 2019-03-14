require 'rails_helper'

feature "Visitor navigate categories" do
  scenario "successfully" do
    category1 = create(:category, name: "Eletricista")
    category2 = create(:category, name: "Encanador")
    create(:contractor, name: "Severino Eletricista", category: category1)
    create(:contractor, name: "Maria Encanador", category: category2)
    
    visit root_path
    click_on("Eletricista")

    expect(page).to have_css('h1', text: "Eletricista")
    expect(page).to have_css('p',text: "Severino Eletricista")
    expect(page).not_to have_css('p', text: "Mario Encanador")

  end
end