class PartiesController < ApplicationController
  def index
  end

  def show
    @party = Party.find params[:id]
  end

  def new
    @party
  end

end
