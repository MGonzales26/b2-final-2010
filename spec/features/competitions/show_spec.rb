require 'rails_helper'

RSpec.describe "Competition Show Page" do
  before :each do
    @rmt = Competition.create!(name: "Rocky Mountain Tournament", location: "Aspen", sport: "Hockey")
    @frt = Competition.create!(name: "Front Range Tournament", location: "Denver", sport: "Hockey")
    @aspen = @rmt.teams.create!(hometown: "Aspen", nickname: "Annihilators")
    @denver = @rmt.teams.create!(hometown: "Denver", nickname: "Destroyers")
    @boulder = @frt.teams.create!(hometown: "Boulder", nickname: "Baddies")
    @aspen1 = @aspen.players.create!(name: "Richard Rocket", age: 13)
    @aspen2 = @aspen.players.create!(name: "Bobby Basher", age: 14)
    @denver1 = @denver.players.create!(name: "Goldberg Goalie", age: 13)
    @denver2 = @denver.players.create!(name: "Elizabeth Evisirator", age: 14)
  end
  describe "As a user" do
    describe "When I visit a competition's show page" do
      it "shows the competition's name, location, and sport" do
        visit competition_path(@rmt)
        
        expect(page).to have_content(@rmt.name)
        expect(page).to have_content(@rmt.location)
        expect(page).to have_content(@rmt.sport)
      end
      it "shows the name and hometown of all teams in this competition" do
        visit competition_path(@rmt)
        
        expect(page).to have_content(@aspen.hometown)
        expect(page).to have_content(@aspen.nickname)
        expect(page).to have_content(@denver.hometown)
        expect(page).to have_content(@denver.nickname)
        expect(page).to have_no_content(@boulder.hometown)
        expect(page).to have_no_content(@boulder.nickname)
      end
      it "shows the average age of all players in the competition" do
        visit competition_path(@rmt)

        expect(page).to have_content(@rmt.players_avg_age)
      end

    end
  end
end


