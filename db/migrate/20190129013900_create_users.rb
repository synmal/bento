class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      # Additional columns
      t.integer :programming_level
      t.string :programming_languages
      t.string :developer_type
      t.string :interest 
    end

    add_index :users, :email
    add_index :users, :remember_token

    
  end
end
