class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone
      t.string :city
      t.string :state
      t.string :zip
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
    User.create!(:username => 'admin', :email => 'paul@vudmaska.com', :phone => '2102873468', 
                   :city => 'Austin', :state => 'Texas', :zip => '78746',
                   :password => '1111', :password_confirmation => '1111')
  end
  
  def self.down
    drop_table :users
  end
end
