class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :active_status, dafault: false, null: false
      t.boolean :send_request, dafault: false, null: false
      t.timestamps
    end
    add_index :friends, :sender_id
    add_index :friends, :recipient_id
    add_index :friends, [:sender_id, :recipient_id], unique: true
  end
end
