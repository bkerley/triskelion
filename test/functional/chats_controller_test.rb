require 'test_helper'

class ChatsControllerTest < ActionController::TestCase
  context 'with a party and player' do
    setup do
      @party = Factory :party
      @player = Factory :player
      session[:player_id] = @player.id
    end

    context 'GET to index' do
      setup do
        @chats = (1..5).map{ Factory :chat, :party=>@party }
        get :index, :party_id=>@party.id
      end

      should respond_with :success
      should 'show the chats for this party' do
        @chats.each do |c|
          assert_match c.content, response.body
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
        @chat = Factory.attributes_for :chat
        post :create, :party_id=>@party.id, :chat=>@chat
      end

      should redirect_to('chats index'){ party_chats_path(@party.id) }
      should 'have created a chat' do
        assert @party.chats.find_by_content @chat[:content]
      end
    end

    context 'JS POST to create' do
      setup do
        @chat = Factory.attributes_for :chat
        post :create, :party_id=>@party.id, :chat=>@chat, :format=>:js
      end

      should respond_with :success
      should respond_with_content_type :js

      should 'have created a chat' do
        assert @party.chats.find_by_content @chat[:content]
      end
    end
  end
end
