require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  context 'a Party' do
    setup do
      @party = Factory :party
    end

    should have_many :rolls
    should have_many :chats
  end
end
