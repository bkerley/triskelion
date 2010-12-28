class ApplicationController < ActionController::Base
  protect_from_forgery

  def party
    @party ||= Party.find party_id
  end

  alias :load_party :party

  def current_player
    @current_player ||= Player.find session[:player_id] rescue nil
  end

  def require_player
    raise 'Need a party id' unless party_id
    redirect_to new_party_player_path party.id unless current_player
  end

  def party_id
    params[:party_id]
  end
end
