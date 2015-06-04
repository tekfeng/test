class CreateAddUsernameToUsers < ActiveRecord::Migration
  def change
    create_table :add_username_to_users do |t|
      t.string :username

      t.timestamps null: false
    end
  end
end
