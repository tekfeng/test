class CreateIncomingComments < ActiveRecord::Migration
  def change
    create_table :incoming_comments do |t|
      t.integer :incoming_id
      t.integer :user_id
      t.text :content
      t.timestamps null: false
    end
  end
end
