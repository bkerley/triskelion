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
  end
end
