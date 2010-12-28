class PartiesController < ApplicationController
  before_filter :require_player

  def party_id
    params[:id]
  end

  def index
  end

  def show
    load_party
  end

  def create
    @party = Party.create
    redirect_to new_party_player_path(@party.id)
  end
end
