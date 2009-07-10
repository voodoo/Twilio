class CreateCallmes < ActiveRecord::Migration
  def self.up
    create_table :callmes do |t|
      t.string :phone
      t.string :zip
      t.boolean :confirmed, :default => false
      t.timestamps
    end
    add_index :callmes, :zip
    add_index :callmes, :phone
  end

  def self.down
    drop_table :callmes
  end
end
