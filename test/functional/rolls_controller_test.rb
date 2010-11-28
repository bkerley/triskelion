require 'test_helper'

class RollsControllerTest < ActionController::TestCase
  context 'with a party and player' do
    setup do
      @party = Factory :party
      @player = Factory :player
      session[:player_id] = @player.id
    end

    context 'GET to index' do
      setup do
        @rolls = (1..5).map{ Factory :roll, :party=>@party }
        get :index, :party_id=>@party.id
      end

      should respond_with :success
      should 'show results for each roll in this party' do
        @rolls.each do |c|
          assert_match c.result.to_s, response.body
        end
      end
    end

    context 'GET to new' do
      setup do
        get :new, :party_id=>@party.id
      end

      should respond_with :success
    end

    context 'POST to create' do
      setup do
        @old_rolls = @party.rolls.all.to_a
        post :create, :party_id=>@party.id, :roll=>{ :code=>'4d20'}
      end

      should redirect_to('rolls index'){ party_rolls_path @party.id }
      should 'have created a roll' do
        new_rolls = @party.rolls.all.to_a
        assert_equal 1, (new_rolls - @old_rolls).length
      end
    end
  end
end
