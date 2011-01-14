require 'test_helper'

class RollTest < ActiveSupport::TestCase
  context 'a Roll' do
    setup do
      @roll = Factory :roll
    end

    should belong_to :player
    should belong_to :party
  end

  context 'a built roll for a party' do
    setup do
      @party = Factory :party
      @roll = @party.rolls.build
    end

    should 'have a blank code' do
      assert @roll.code.blank?
    end
  end

  context 'with dice code 4d6, a player, and a party' do
    setup do
      @code = '4d6'
      @player = Factory :player
      @party = Factory :party
    end

    context 'creating a new roll' do
      setup do
        @roll = Roll.create_with_code :code=>@code, :player=>@player, :party=>@party
      end

      should 'create a roll object' do
        assert @roll.id
        assert Roll.find @roll.id
      end

      should 'have a code of "4d6"' do
        assert_equal '4d6', @roll.code
      end

      should 'set a result between 4 and 24' do
        assert(4 <= @roll.result)
        assert(@roll.result <= 24)
      end
    end
  end
end
