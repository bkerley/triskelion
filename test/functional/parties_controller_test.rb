require 'test_helper'

class PartiesControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should respond_with :success
  end

  context 'GET to show' do
    setup do
      @party = Factory :party
      get :show, :id=>@party.id
    end

    should respond_with :success
  end

  context 'POST to new' do
    setup do
      post :new
      @new_party = Party.first :order=>'created_at desc'
    end

    should redirect_to('the new player form') do
      new_party_player_path :party_id=>@new_party.id
    end
  end
end
