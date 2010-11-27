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
end
