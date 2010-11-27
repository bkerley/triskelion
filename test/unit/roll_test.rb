require 'test_helper'

class RollTest < ActiveSupport::TestCase
  context 'a Roll' do
    setup do
      @roll = Factory :roll
    end

    should belong_to :player
    should belong_to :party
  end
end
