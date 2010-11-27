require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  context 'with a party' do
    setup do
      @party = Factory :party
    end

    context 'GET to new' do
      setup do
        get :new, :party_id=>@party.id
      end

      should respond_with :success
    end

    context 'POST to create' do
      setup do
        post :create, :party_id=>@party.id, :player=>Factory.attributes_for(:player)
      end

      should set_session :player_id
      should redirect_to('the party'){ party_path @party.id }
    end
  end
end
