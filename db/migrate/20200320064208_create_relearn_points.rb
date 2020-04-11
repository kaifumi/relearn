class CreateRelearnPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :relearn_points do |t|
      t.integer :post_id, null: false, index: true
      t.integer :first_score, default: 0, null: false
      t.integer :second_score, default: 0, null: false
      t.integer :third_score, default: 0, null: false
      t.integer :forth_score, default: 0, null: false
      t.timestamps
    end
  end
end
