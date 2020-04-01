class NotificationsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # 通知内容の一覧表示
  def index; end

  # 通知時間の更新
  def update; end
end
