require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  context 'a Player' do
    setup do
      @player = Factory :player
    end

    should have_many :rolls
    should have_many :chats
  end
end
