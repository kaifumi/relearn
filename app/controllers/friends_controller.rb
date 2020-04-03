class FriendsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # テンプレートエラーになったため検索前のページを用意した
  def search_before
    # userモデルにsearchメソッドを記述
    @users = User.search(params[:search_word])
  end

  # 友達検索
  def search
    # userモデルにsearchメソッドを記述
    @users = User.search(params[:search_word])
  end

  # 友達リクエストの送信
  def send_request
    Friend.create(send_request: true, sender_id: current_user.id, recipient_id: params[:user_id], active_status: false)
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
  def index; end

  # 友達作成
  def create; end

  # 友達リクエスト承認or拒否
  def update; end

  # 友達解除
  def destroy; end
end
