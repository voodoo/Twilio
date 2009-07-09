class CreateTwimls < ActiveRecord::Migration
  def self.up
    create_table :twimls do |t|
      t.integer :position
      t.string  :name
      t.string  :action
      t.timestamps
    end
  end

  def self.down
    drop_table :twimls
  end
end
