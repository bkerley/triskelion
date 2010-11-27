class ApplicationController < ActionController::Base
  protect_from_forgery

  def load_party
    @party = Party.find params[:party_id]
  end

  def current_player
    @current_player ||= Player.find session[:player_id]
  end
end
