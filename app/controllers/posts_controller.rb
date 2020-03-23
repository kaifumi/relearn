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
    # _point_formで使用するrelearn_pointのデータの入れ方条件分岐
    if RelearnPoint.find_by(post_id: params[:id]).nil?
      # もしrelearn_pointのレコードがなければ作らせる
      @relearn_point = RelearnPoint.create!(post_id: params[:id])
    end
    @relearn_point = RelearnPoint.find_by(post_id: params[:id])
    if PlanTiming.find_by(post_id: params[:id]).nil?
      # もしplan_timingのレコードがなければ作らせる
      @plan_timing = PlanTiming.call(post_id: @post.id, first_term: 1.day.from_now,
                                     second_term: 3.days.from_now, third_term: 10.days.from_now, forth_term: 1.month.from_now)
    end
    @plan_timing = PlanTiming.find_by(post_id: params[:id])
  end

  # 新規投稿の保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # 新規投稿時に復習ポイントのレコードと通知予定時間のレコードを作成する
      RelearnPoint.create(post_id: @post.id)
      # 予定している通知時間を1日後、3日後、10日後、1ヶ月後に設定
      PlanTiming.create(post_id: @post.id, first_term: 1.day.from_now,
                        second_term: 3.days.from_now, third_term: 10.days.from_now, forth_term: 1.month.from_now)
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
