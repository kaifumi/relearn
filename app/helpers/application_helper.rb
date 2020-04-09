module ApplicationHelper
  # 未読通知を確認するメソッド
  def unchecked_notifications
    current_user.passive_notifications.where(checked: false)
  end
end
