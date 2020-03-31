class CreatePlanTimings < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_timings do |t|
      t.integer :post_id, null: false
      # 投稿作成時にt=Time.currentを実行して、t.since(日付)の値を代入する
      t.datetime :first_term
      t.datetime :second_term
      t.datetime :third_term
      t.datetime :forth_term
      t.datetime :first_min
      t.datetime :first_max
      t.datetime :second_min
      t.datetime :second_max
      t.datetime :third_min
      t.datetime :third_max
      t.datetime :forth_min
      t.datetime :forth_max
      t.timestamps
    end
  end
end
