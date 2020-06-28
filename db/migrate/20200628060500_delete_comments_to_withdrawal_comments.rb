class DeleteCommentsToWithdrawalComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :delete_comments, :withdrawal_comments
  end
end
