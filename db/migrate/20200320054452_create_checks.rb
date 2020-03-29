class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.integer :post_id, null: false
      t.boolean :first_check, default: false, null: false
      t.boolean :second_check, default: false, null: false
      t.boolean :third_check, default: false, null: false
      t.boolean :forth_check, default: false, null: false
      t.timestamps
    end
  end
end
