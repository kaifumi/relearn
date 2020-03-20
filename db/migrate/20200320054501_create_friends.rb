class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.boolean :active_status, dafault: false, null: false
      t.boolean :send_request, dafault: false, null: false
      t.timestamps
    end
  end
end
