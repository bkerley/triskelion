require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  context 'with a party and player' do
    setup do
      @party = Factory :party
      @player = Factory :player
      session[:player_id] = @player.id
    end

    context 'JS GET to index since just now' do
      setup do
        get :index, :party_id=>@party.id, :since=>Time.now.to_f, :format=>:js
      end

      should respond_with :success
      should respond_with_content_type :js
    end

    context 'and some chats and rolls' do
      setup do
        @start = Time.now
        @expected = (0..5).map do
          [
           Factory(:chat, :party=>@party),
           Factory(:roll, :party=>@party)
         ]
        end
      end

      context 'JS get to index since before the chats and rolls' do
        setup do
          get :index, :party_id=>@party.id, :since=>@start.to_f, :format=>:js
        end

        should respond_with :success
        should respond_with_content_type :js

        should 'include each chat and description' do
          @expected.each do |e|
            assert_match e[0].content, response.body
            assert_match e[1].description, response.body
          end
        end
      end
    end
  end
end
