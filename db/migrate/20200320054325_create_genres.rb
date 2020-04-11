class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :user_id, null: false, index: true
      t.string :type, null: false
      t.timestamps
    end
  end
end
