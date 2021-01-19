require 'rails_helper'

RSpec.describe "Competition Index Page" do
  before :each do
    @rmt = Competition.create!(name: "Rocky Mountain Tournament", location: "Aspen", sport: "Hockey")
    @frt = Competition.create!(name: "Front Range Tournament", location: "Denver", sport: "Hockey")
  end
  describe "As a user" do
    describe "When I visit the competion index" do
      it "shows the names of all competitions" do
        visit competitions_path
        
        expect(page).to have_content(@rmt.name)
        expect(page).to have_content(@frt.name)
      end
      it "has competition name linked to its show page" do
        visit competitions_path

        expect(page).to have_link(@rmt.name)
        expect(page).to have_link(@frt.name)
        
        click_on("#{@rmt.name}")
        expect(current_path).to eq(competition_path(@rmt))
      end
    end
  end
end
