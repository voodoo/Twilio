class CreateTwimls < ActiveRecord::Migration
  def self.up
    create_table :twimls do |t|
      t.string  :name
      t.boolean :gather
      t.string  :action
      t.timestamps
    end
  end

  def self.down
    drop_table :twimls
  end
end
