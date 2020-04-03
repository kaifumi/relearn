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

  # 受け取った友達リクエスト一覧表示
  # リクエストを使うと'has_content_type?'とエラーが出る
  def receive; end

  # 友達一覧
  def index; end

  # 友達作成
  def create; end

  # 友達リクエスト承認or拒否
  def update; end

  # 友達解除
  def destroy; end
end
