class NotificationsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # 通知内容の一覧表示
  def index
    # ユーザーが受け取った通知を抽出
    @notifications = current_user.passive_notifications.page(params[:page])
    # 通知を未読の場合は既読にする
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

  # 通知を全削除
  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to users_notifications_path
  end
end
