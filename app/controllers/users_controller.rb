class UsersController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # ユーザー編集画面を表示
  def edit; end

  # 編集内容を更新
  def update; end

  # ユーザー論理削除および退会
  def destroy; end

  # 退会の選択の画面を表示
  def sign_out_confirmation; end
end
