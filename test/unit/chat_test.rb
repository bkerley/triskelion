require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  context 'a Chat' do
    setup do
      @chat = Factory :chat
    end

    should belong_to :player
    should belong_to :party

    should 'be findable with the "since" scope' do
      @new_chat = Factory :chat

      assert_equal [@chat, @new_chat], Chat.since(@chat.created_at - 1)
      assert_equal [@new_chat], Chat.since(@chat.created_at)
    end
  end
end
