class CreatePets < ActiveRecord::Migration
  def self.up
    create_table :pets do |t|
      t.integer :user_id
      t.string :name
      t.string :dog_or_cat,    :default => 'Dog'
      t.string :lost_or_found, :default => 'Lost'
      t.string :sex, :default => 'Male'
      t.string :color
      t.string :weight
      t.string :description
      t.timestamps     
    end
  end

  def self.down
    drop_table :pets
  end
end
