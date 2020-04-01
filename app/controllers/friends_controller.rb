class FriendsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!
  # 友達検索
  def search; end

  # 友達リクエスト一覧表示
  def request; end

  # 友達一覧
  def index; end

  # 友達作成
  def create; end

  # 友達リクエスト承認or拒否
  def update; end

  # 友達解除
  def destroy; end
end
