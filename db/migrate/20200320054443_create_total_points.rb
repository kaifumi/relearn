class CreateTotalPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :total_points do |t|
      t.integer :user_id, null: false, index: true
      t.integer :score, default: 0, null: false
      t.timestamps
    end
  end
end
