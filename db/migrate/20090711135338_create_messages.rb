class CreateMessages < ActiveRecord::Migration
  def self.up
    
    create_table :messages do |t|
      t.integer :user_id
      t.string  :email
      t.text    :message
      t.string  :ip
      t.timestamps
    end
    
    create_table :phone_messages do |t|
      t.integer :user_id
      t.string  :url
      t.string  :phone
      t.timestamps
    end    
  end

  def self.down
    drop_table :messages
    drop_table :phone_messages
  end
end
