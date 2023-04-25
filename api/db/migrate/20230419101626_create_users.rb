class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest
      t.text :email
      t.integer :user_type, default: 0

      t.timestamps
    end
  end
end
