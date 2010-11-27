class CreateChats < ActiveRecord::Migration
  def self.up
    create_table :chats do |t|
      t.integer :party_id
      t.integer :player_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :chats
  end
end
