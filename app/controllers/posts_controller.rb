class PostsController < ApplicationController
  # 投稿の新規登録
  def new
    @post = Post.new
    @genres = Genre.all
  end

  # 投稿一覧画面の表示
  def index; end

  # ジャンルごとの投稿一覧
  def genre_index; end

  # 投稿詳細画面の表示
  def show; end

  # 新規投稿の保存
  def create; end

  # 投稿の編集
  def edit; end

  # 編集内容の更新
  def update; end

  # 投稿の削除
  def destroy; end

  # 復習完了した投稿のtop
  def complete_top; end

  # 復習完了した投稿の詳細
  def complete_show; end
end
