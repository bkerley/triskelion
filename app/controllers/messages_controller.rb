class MessagesController < ApplicationController
  def index
    respond_to do |wants|
      wants.js
    end
  end
end
