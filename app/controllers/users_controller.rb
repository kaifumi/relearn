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
    render :update
  end

  # ユーザー論理削除および退会
  def destroy
    # 退会時のコメントを保存する
    # コメント保存できなくて挙動がおかしい
    delete_comment = DeleteComment.new(user_id: current_user.id, message: params[:message])
    delete_comment.message = delete_comment_params[:message]
    delete_comment.save
    user = User.find(current_user.id)
    if user.destroy
      flash[:warning] = 'ユーザーを削除しました。'
      redirect_to new_user_registration_path
    else
      flash[:danger] = 'ユーザーの削除に失敗しました。'
      redirect_to request.referer
    end
  end

  # 退会の選択の画面を表示
  def sign_out_confirmation
    @delete_comment = DeleteComment.new
  end

  private

    def user_params
      params.require(:user).permit(:image, :name, :email, :email_status, :rank_status, :search_status)
    end

    def delete_comment_params
      params.require(:delete_comment).permit(:message)
    end
end
