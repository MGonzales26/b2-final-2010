require 'rails_helper'

RSpec.describe "New Team Page" do
  it "has a form to create a new team" do
    @rmt = Competition.create!(name: "Rocky Mountain Tournament", location: "Aspen", sport: "Hockey")

    visit new_competition_team_path(@rmt)

    expect(page).to have_field(:hometown)
    expect(page).to have_field(:nickname)
  end
  it "makes a new team and returns to the show page" do
    @rmt = Competition.create!(name: "Rocky Mountain Tournament", location: "Aspen", sport: "Hockey")

    visit new_competition_team_path(@rmt)

    fill_in "hometown", :with => "Denver"
    fill_in "nickname", :with => "Destroyers"
    click_on "Submit"

    expect(page).to have_content("Denver Destroyers")
  end
end