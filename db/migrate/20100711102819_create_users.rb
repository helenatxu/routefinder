class CreateUsers < ActiveRecord::Migration
  def self.up


    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :photo_url
      t.string :hashed_password
      t.string :salt
      t.text :profile
      t.boolean :is_admin

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
