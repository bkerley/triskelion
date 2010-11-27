class Chat < ActiveRecord::Base
  belongs_to :player
  belongs_to :party
end
