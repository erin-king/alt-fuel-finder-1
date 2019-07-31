require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      # expect(page).to have_selector("input[value='Search by zip...']")
      expect(page).to have_selector('.form-group', 'Search by zip...')
      expect(page).to have_button("Locate")
    end
  end
end
