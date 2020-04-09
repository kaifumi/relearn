class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :content
      t.string :link
      t.integer :relearn_count, default: 0
      t.boolean :relearn_complete, default: false
      t.integer :total_point, default: 0
      t.timestamps
    end
    # 検索がよく行われる想定のため、indexを張る
    add_index :posts, :title
    add_index :posts, :content
    add_index :posts, :relearn_count
    add_index :posts, :total_point
  end
end
