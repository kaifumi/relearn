class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :receiver_id
      t.integer :plan_timing_id
      t.integer :term_num
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
    add_index :notifications, :visitor_id
    add_index :notifications, :receiver_id
    add_index :notifications, [:visitor_id, :receiver_id], unique: true
  end
end
