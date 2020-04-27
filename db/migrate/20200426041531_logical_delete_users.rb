
class LogicalDeleteUsers < ActiveRecord::Migration
  def up
    add_column :users, :logical_uniqueness, :boolean, default: true
    remove_index :users, :email
    add_index :users, [:email, :logical_uniqueness], unique: true
    execute <<-SQL
CREATE TRIGGER `set_logical_uniqueness_on_users` BEFORE UPDATE ON `users`
  FOR EACH ROW
  BEGIN
    IF NEW.`deleted_at` IS NULL THEN
      SET NEW.`logical_uniqueness` = TRUE\;
    ELSE
      SET NEW.`logical_uniqueness` = NULL\;
    END IF\;
  END;
    SQL
  end 

  def down
    execute <<-SQL
DROP TRIGGER `set_logical_uniqueness_on_users`;
    SQL
    remove_index :users, [:email, :logical_uniqueness]
    add_index :users, :email, unique: true
    remove_column :users, :logical_uniqueness
  end
end

