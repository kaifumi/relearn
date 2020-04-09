class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :user_id, null: false
      t.float :total_rate, default: 0, null: false
      t.integer :count, default: 0, null: false
      t.timestamps
    end
    add_index :rates, :user_id
  end
end
