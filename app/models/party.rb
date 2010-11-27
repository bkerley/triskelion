class Party < ActiveRecord::Base
  has_many :rolls
  has_many :chats
end
