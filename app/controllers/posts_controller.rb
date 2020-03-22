class PostsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # 投稿の新規登録
  def new
    @post = Post.new
  end

  # 投稿一覧画面の表示
  def index
    @posts = Post.where(user_id: current_user.id).page(params[:page]).per(20)
    @genres = Genre.where(user_id: current_user.id)
  end

  # ジャンルごとの投稿一覧
  def genre_posts_index
    @genre = Genre.find(params[:id])
    @posts = Post.where(user_id: current_user.id, genre_id: @genre.id).page(params[:page]).per(20)
    @genres = Genre.where(user_id: current_user.id)
  end

  # 投稿詳細画面の表示
  def show
    @post = Post.find(params[:id])
    @genre = Genre.find_by(id: @post.genre_id)
  end

  # 新規投稿の保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = '投稿完了しました。'
      redirect_to post_path(@post)
    else
      flash[:alert] = '投稿失敗しました。'
      render :new
    end
  end

  # 投稿の編集
  def edit
    @post = Post.find(params[:id])
  end

  # 編集内容の更新
  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      flash[:success] = '更新完了しました。'
      redirect_to post_path(@post)
    else
      flash[:alert] = '更新失敗しました。'
      render :edit
    end
  end

  # 投稿の削除
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = '投稿削除しました。'
      redirect_to posts_path
    else
      flash[:alert] = '更新失敗しました。'
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :content, :link)
  end
end