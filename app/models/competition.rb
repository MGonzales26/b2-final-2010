class Competition < ApplicationRecord
  has_many :participants
  has_many :teams, through: :participants

  def players_avg_age
    averages = []
    teams.find_each do |team|
      averages << team.players.average(:age).to_f
    end
    averages.sum.to_f / averages.count
  end
end
