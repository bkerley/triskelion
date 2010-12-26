class Roll < ActiveRecord::Base
  belongs_to :party
  belongs_to :player
  before_create :roll_dice

  def self.create_with_code(options)
    options.stringify_keys!
    code = options.delete 'code'
    split_codes = code.split('d')
    options['count'] = split_codes[0]
    options['sides'] = split_codes[1]

    create options
  end

  def code
    return nil unless count && sides
    "#{count}d#{sides}"
  end

  private
  def roll_dice
    results_array = (1..self.count).to_a.map{ roll_a_die }
    self.result = results_array.inject(&:+)
    self.description = results_array.join ' '
  end

  def roll_a_die
    # +1 because we can roll a zero
    ActiveSupport::SecureRandom.random_number(self.sides) + 1
  end
end
