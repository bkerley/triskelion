class Chat < ActiveRecord::Base
  belongs_to :player
  belongs_to :party

  scope :since, lambda { |time| where 'created_at > ?', time }
end
