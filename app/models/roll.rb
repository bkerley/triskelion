class Roll < ActiveRecord::Base
  belongs_to :party
  belongs_to :player
  before_create :roll_dice

  def self.create_with_code(options)
    create options
  end

  private
  def roll_dice
    self.result = Crapshoot.roll self.code
    self.description = self.result
  end
end
