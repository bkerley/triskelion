class ChatsController < ApplicationController
  before_filter :load_party
  def index
    @chats = @party.chats.all :order=>'created_at desc', :limit=>50
  end

  def new
  end

  def create
    @chat = @party.chats.create! :player=>current_player, :content=>params[:chat][:content]
    respond_to do |wants|
      wants.html { redirect_to party_chats_path @party.id }
      wants.js { render :template=>'messages/index' }
    end
  end
end
