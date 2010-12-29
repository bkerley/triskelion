class RemoveOldColumnsFromRolls < ActiveRecord::Migration
  def self.up
    change_table :rolls do |t|
      t.remove :count
      t.remove :sides
      t.rename :new_code, :code
    end
  end

  def self.down
    change_table :rolls do |t|
      t.create :count, :integer
      t.create :sides, :integer
      t.rename :code, :new_code
    end
  end
end
