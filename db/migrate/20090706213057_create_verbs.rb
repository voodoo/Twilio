class CreateVerbs < ActiveRecord::Migration
  def self.up
    create_table :verbs do |t|
      t.integer :twiml_id
      t.string :voice
      t.string :action
      t.string :text
      t.string :verb_type
      t.timestamps
    end    
  end

  def self.down
    drop_table :verbs
  end
end
