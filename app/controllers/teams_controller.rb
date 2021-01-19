class TeamsController < ApplicationController

  def new

  end

  def create
    @comp = Competition.find(params[:competition_id])
    @comp.teams.create!(hometown: params[:hometown],
                 nickname: params[:nickname],
                 )
    redirect_to competition_path(@comp) 
  end
end