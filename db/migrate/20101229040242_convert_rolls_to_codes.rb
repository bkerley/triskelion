class ConvertRollsToCodes < ActiveRecord::Migration
  def self.up
    Roll.all.each do |r|
      r.new_code = r.code
      r.save
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration.new
  end
end
