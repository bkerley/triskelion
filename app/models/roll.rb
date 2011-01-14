class Roll < ActiveRecord::Base
  belongs_to :party
  belongs_to :player
  before_create :roll_dice

  scope :since, lambda { |time| where 'created_at > ?', time }

  def self.create_with_code(options)
    create options
  end

  private
  def roll_dice
    roll = Crapshoot.roll self.code
    self.result = roll
    self.description = roll.description
  end
end
