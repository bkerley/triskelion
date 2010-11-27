class Roll < ActiveRecord::Base
  belongs_to :party
  belongs_to :player
end
