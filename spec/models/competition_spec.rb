require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "Relationship" do
    it {should have_many :participants}
    it {should have_many(:teams).through(:participants)}
  end

  describe "Instance Methods" do
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
    describe "#players_avg_age" do
      it "average the age of all the players in the competition" do

        expect(@rmt.players_avg_age).to eq(13.5)
      end
    end
  end
end
