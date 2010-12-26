class PlayersController < ApplicationController
  before_filter :load_party

  def new
    @player = Player.new
  end

  def create
    @player = Player.create params[:player]
    session[:player_id] = @player.id

    redirect_to party_path @party.id
  end
end
