class CreateRealTimings < ActiveRecord::Migration[5.2]
  def change
    create_table :real_timings do |t|
      t.integer :post_id, null: false
      # 値が無い場合も想定しているためnull: falseは不要
      t.datetime :first_term, default: ''
      t.datetime :second_term, default: ''
      t.datetime :third_term, default: ''
      t.datetime :forth_term, default: ''
      t.timestamps
    end
    add_index :real_timings, :post_id
  end
end
