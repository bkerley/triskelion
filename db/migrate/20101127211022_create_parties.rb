class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
