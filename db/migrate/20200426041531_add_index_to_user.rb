class AddIndexToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true, where: 'deleted_at IS NULL'
  end
end
