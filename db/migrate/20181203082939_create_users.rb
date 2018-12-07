class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest
      t.string :role, null: false, default: 'user'
      t.datetime :last_login
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.timestamps
    end
  end
end
