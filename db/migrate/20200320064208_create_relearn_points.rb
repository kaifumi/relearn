class CreateRelearnPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :relearn_points do |t|
      t.integer :post_id, null: false
      t.integer :first_score
      t.integer :second_score
      t.integer :third_score
      t.integer :forth_score
      t.timestamps
    end
  end
end
