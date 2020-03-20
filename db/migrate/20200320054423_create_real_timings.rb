class CreateRealTimings < ActiveRecord::Migration[5.2]
  def change
    create_table :real_timings do |t|
      t.integer :post_id, null: false
      # 値が無い場合も想定しているためnull: falseは不要
      t.datetime :first_term
      t.datetime :second_term
      t.datetime :third_term
      t.datetime :forth_term
      t.timestamps
    end
  end
end
