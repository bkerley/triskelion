class PartiesController < ApplicationController
  def index
  end

  def show
    @party = Party.find params[:id]
  end

  def create
    @party = Party.create
    redirect_to new_party_player_path(@party.id)
  end
end
