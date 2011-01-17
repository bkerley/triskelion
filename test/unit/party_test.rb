require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  context 'a Party' do
    setup do
      @party = Factory :party
    end

    should have_many :rolls
    should have_many :chats

    context 'recent_messages method' do
      setup do
        @my_roll = Factory :roll, :party=>@party
        @my_chat = Factory :chat, :party=>@party
      end

      should 'find a roll and chat' do
        assert_equal [@my_roll, @my_chat], @party.recent_messages
      end
    end

    context 'messages_since method' do
      setup do
        @start = Time.now
        @foreign_roll = Factory :roll
        @foreign_chat = Factory :chat
      end

      context 'with no messages' do
        should 'not find any messages' do
          assert_equal [], @party.messages_since(@start)
        end
      end

      context 'with messages' do
        setup do
          @my_roll = Factory :roll, :party=>@party
          @my_chat = Factory :chat, :party=>@party
        end

        should 'find some messages' do
          assert_equal [@my_roll, @my_chat], @party.messages_since(@start)
        end
      end
    end
  end
end
