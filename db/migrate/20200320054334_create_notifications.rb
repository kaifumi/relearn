class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :receiver_id
      t.integer :post_id
      t.integer :plan_timing_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
    add_index :notifications, :visiter_id
    add_index :notifications, :receiver_id
    add_index :notifications, [:visiter_id, :receiver_id], unique: true
  end
end
