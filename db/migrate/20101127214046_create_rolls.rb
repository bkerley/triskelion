class CreateRolls < ActiveRecord::Migration
  def self.up
    create_table :rolls do |t|
      t.integer :party_id
      t.integer :player_id
      t.integer :count
      t.integer :sides
      t.integer :result
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :rolls
  end
end
