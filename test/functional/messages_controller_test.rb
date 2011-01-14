require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  context 'with a party and player' do
    setup do
      @party = Factory :party
      @player = Factory :player
      session[:player_id] = @player.id
    end

    context 'JS GET to index' do
      setup do
        get :index, :party_id=>@party.id, :format=>:js
      end
    end
  end
end
