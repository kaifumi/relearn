class UsersController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # ユーザー編集画面を表示
  def edit
    @user = User.find(current_user.id)
  end

  # ユーザー情報の更新を非同期で処理
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash.now[:warning] = 'ユーザー情報更新しました。'
    else
      flash.now[:danger] = 'ユーザー情報更新に失敗しました。'
    end
  end

  # ユーザー論理削除および退会
  def destroy; end

  # 退会の選択の画面を表示
  def sign_out_confirmation; end

  private

  def user_params
    params.require(:user).permit(:image, :name, :email, :email_status, :rank_status, :search_status)
  end
end
