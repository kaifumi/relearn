class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :user_id, null: false
      t.integer :relearn_average, default: 1, null: false
      t.timestamps
    end
  end
end
