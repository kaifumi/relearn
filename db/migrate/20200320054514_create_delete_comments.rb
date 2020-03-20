class CreateDeleteComments < ActiveRecord::Migration[5.2]
  def change
    create_table :delete_comments do |t|
      t.integer :user_id, null: false
      t.text :message 
      t.timestamps
    end
  end
end
