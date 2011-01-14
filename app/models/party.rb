class Party < ActiveRecord::Base
  has_many :rolls
  has_many :chats

  def messages_since(time)
    messages = rolls.since(time) + chats.since(time)
    messages.sort_by(&:created_at)
  end
end
