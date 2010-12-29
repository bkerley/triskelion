class AddCodeToRolls < ActiveRecord::Migration
  def self.up
    add_column :rolls, :new_code, :string
  end

  def self.down
    remove_column :rolls, :new_code
  end
end
