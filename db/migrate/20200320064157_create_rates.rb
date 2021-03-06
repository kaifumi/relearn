class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :user_id, null: false, index: true
      t.float :total_rate, default: 0, null: false
      t.integer :count, default: 0, null: false
      t.timestamps
    end
  end
end
