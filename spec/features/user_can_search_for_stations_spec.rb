require "rails_helper"

feature "User can visit search page and see 10 closest stations" do
  it 'when they click on locate with valid zip code' do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    fill_in :zip_code, with: "80203"
    # And I click "Locate"
    find('#locate').click

    # Then I should be on page "/search"
    expect(current_path).to eq('/search')
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_css('.station', count: 10)
    # And the stations should be limited to Electric and Propane
    expect(page).to have_content("Electric")
    expect(page).to have_content("Propane")
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within(first('.station')) do
      expect(page). to have_css('.name')
      expect(page). to have_css('.address')
      expect(page). to have_css('.fuel-types')
      expect(page). to have_css('.distance')
      expect(page). to have_css('.access-times')
    end
  end
end
