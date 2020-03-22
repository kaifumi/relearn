class PostsController < ApplicationController
  # ログインユーザーのみ実行可能
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
  def genre_index; end

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
  def edit; end

  # 編集内容の更新
  def update; end

  # 投稿の削除
  def destroy; end

  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :content, :link)
  end
end
