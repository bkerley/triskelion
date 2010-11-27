require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  context 'a Chat' do
    setup do
      @chat = Factory :chat
    end

    should belong_to :player
    should belong_to :party
  end
end
