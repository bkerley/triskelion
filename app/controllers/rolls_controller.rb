class RollsController < ApplicationController
  before_filter :load_party
  def index
    @rolls = @party.rolls.all :order=>'created_at desc', :limit=>50
  end

  def new
  end

  def create
    @roll = Roll.create_with_code :code=>params[:roll][:code], :player=>current_player, :party=>@party
    respond_to do |wants|
      wants.html { redirect_to party_rolls_path @party.id }
      wants.js
    end
  end
end
