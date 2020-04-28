class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :image_id
      t.boolean :email_status,null:false, default:true
      t.boolean :rank_status,null:false, default:false
      t.boolean :search_status,null:false, default:false
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      # 外部APIログイン用
      t.string :provider
      t.string :uid
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :users, :reset_password_token, unique: true
  end
end
