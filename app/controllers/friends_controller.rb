class FriendsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # 友達検索
  def search
    # userモデルにsearchメソッドを記述
    @users = User.search(params[:search_word], current_user.id)
  end

  # 友達リクエストの送信
  def send_request
    # リクエストを送った時点でレコードを作成
    Friend.create(send_request: true, sender_id: current_user.id, recipient_id: params[:user_id], active_status: false)
    # リクエスト送信時の通知レコード作成メソッド
    User.create_notification_request!(current_user, params[:user_id])
    # each文中から引っ張ってきているので再定義必要
    @user_id = params[:user_id]
    render 'status_change'
  end

  # 友達リクエストの取り消し
  def cancel_request
    friend = Friend.find_by(send_request: true, sender_id: current_user.id, recipient_id: params[:user_id])
    friend.destroy
    # each文中から引っ張ってきているので再定義必要
    @user_id = params[:user_id]
    render 'status_change'
  end

  # 受け取った友達リクエスト一覧表示
  # リクエストを使うと'has_content_type?'とエラーが出る
  def receive
    @senders = Friend.where(recipient_id: current_user.id, send_request: true, active_status: false)
  end

  # 友達一覧
  def index
    # active_statusがtrueかつsender_idもしくはrecipient_idがcurrent_idの時の集合
    # whereで複数条件検索
    @friends = Friend.where(active_status: true).where('(sender_id=?) or (recipient_id=?)', current_user.id, current_user.id)
  end

  # 友達リクエスト承認or拒否
  def update
    friend = Friend.find_by(sender_id: params[:id], recipient_id: current_user.id, send_request: true, active_status: false)
    # judgeにはtrueかfalseが入る
    if params[:judge] == 'true'
      if friend.update(active_status: true)
        # リクエスト承認したときの通知レコードを作成するメソッド
        User.create_notification_approve!(current_user, params[:id])
        flash[:warning] = 'リクエストを承認しました'
      else
        flash[:danger] = 'リクエストの承認に失敗しました'
      end
    else
      flash[:danger] = if friend.destroy
                         'リクエストを拒否しました'
                       else
                         'リクエストの拒否に失敗しました'
                       end
    end
    redirect_to request.referer
  end

  # 友達解除
  def destroy
    friend = Friend.where(active_status: true).where('(sender_id=?) or (recipient_id=?)',
                                                     current_user.id, current_user.id).where('(sender_id=?) or (recipient_id=?)', params[:id], params[:id])
    if friend[0].destroy
      flash[:warning] = '友達解除しました'
    else
      flash[:danger] = '友達解除に失敗しました'
    end
    redirect_to request.referer
  end
end
