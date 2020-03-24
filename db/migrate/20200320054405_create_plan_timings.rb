class CreatePlanTimings < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_timings do |t|
      t.integer :post_id, null: false
      # 投稿作成時にt=Time.currentを実行して、t.since(日付)の値を代入する
      t.datetime :first_term, default: '', null: false
      t.datetime :second_term, default: '', null: false
      t.datetime :third_term, default: '', null: false
      t.datetime :forth_term, default: '', null: false
      t.datetime :first_min, default: '', null: false
      t.datetime :first_max, default: '', null: false
      t.datetime :second_min, default: '', null: false
      t.datetime :second_max, default: '', null: false
      t.datetime :third_min, default: '', null: false
      t.datetime :third_max, default: '', null: false
      t.datetime :forth_min, default: '', null: false
      t.datetime :forth_max, default: '', null: false
      t.timestamps
    end
  end
end
