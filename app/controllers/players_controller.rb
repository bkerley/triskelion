class PlayersController < ApplicationController
  before_filter :load_party

  def new
  end

  def create
    @player = Player.create params[:player]
    session[:player_id] = @player.id

    redirect_to party_path @party.id
  end

  private
  def load_party
    @party = Party.find params[:party_id]
  end
end
