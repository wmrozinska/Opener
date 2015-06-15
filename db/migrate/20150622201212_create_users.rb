class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :session_token
      t.string :user_name
      t.string :password
      t.string :email
      t.timestamps null: false
    end
  end
end
