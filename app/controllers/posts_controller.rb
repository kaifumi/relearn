class PostsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!
  # 自分と友達以外の投稿情報は見れないようにチェック
  before_action :correct_friend_check, only: [:index, :genre_posts_index, :show, :new, :edit]

  # 投稿の新規登録
  def new
    @post = Post.new
  end

  # 投稿一覧画面の表示
  def index
    @posts = Post.where(user_id: params[:user_id], relearn_complete: false).page(params[:page])
    @genres = Genre.where(user_id: params[:user_id]).limit(20)
  end

  # ジャンルごとの投稿一覧
  def genre_posts_index
    @genre = Genre.find(params[:id])
    @posts = Post.where(user_id: params[:user_id], genre_id: @genre.id).page(params[:page])
    @genres = Genre.where(user_id: params[:user_id]).limit(20)
  end

  # 投稿詳細画面の表示
  def show
    @post = Post.find(params[:id])
    @genre = Genre.find_by(id: @post.genre_id)
    # _point_formで使用するrelearn_pointのデータの入れ方条件分岐
    if RelearnPoint.find_by(post_id: params[:id]).nil?
      # もしrelearn_pointのレコードがなければ作らせる
      RelearnPoint.create!(post_id: params[:id])
    end
    if PlanTiming.find_by(post_id: params[:id]).nil?
      # もしplan_timingのレコードがなければ作らせる
      @plan_timing = PlanTiming.create!(post_id: @post.id, first_term: 1.day.from_now.strftime('%Y-%m-%d %H:%M'),
                                        second_term: 3.days.from_now.strftime('%Y-%m-%d %H:%M'),
                                        third_term: 10.days.from_now.strftime('%Y-%m-%d %H:%M'),
                                        forth_term: 1.month.from_now.strftime('%Y-%m-%d %H:%M'))
    end
    # 通知時間の表示用
    @plan_timing = Form::PlanTiming.find_by(post_id: params[:id])
    # 通知時間と現在時刻の差異でフォームの出すタイミングを設定
    @time_now = Time.zone.now
    @real_timing = RealTiming.find_by(post_id: params[:id])
  end

  # 新規投稿の保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # 新規投稿時に復習ポイントのレコードと通知予定時間のレコードを作成する
      RelearnPoint.create(post_id: @post.id)
      # 予定している通知時間を1日後、3日後、10日後、1ヶ月後に設定
      PlanTiming.create(post_id: @post.id, first_term: 1.day.from_now.strftime('%Y-%m-%d %H:%M'),
                        second_term: 3.days.from_now.strftime('%Y-%m-%d %H:%M'), third_term: 10.days.from_now.strftime('%Y-%m-%d %H:%M'),
                        forth_term: 1.month.from_now.strftime('%Y-%m-%d %H:%M'),
                        first_min: 1.hour.from_now.strftime('%Y-%m-%d %H:%M'), first_max: 2.days.from_now.strftime('%Y-%m-%d %H:%M'),
                        second_min: 3.days.from_now.strftime('%Y-%m-%d %H:%M'), second_max: 7.days.from_now.strftime('%Y-%m-%d %H:%M'),
                        third_min: 8.days.from_now.strftime('%Y-%m-%d %H:%M'), third_max: 14.days.from_now.strftime('%Y-%m-%d %H:%M'),
                        forth_min: 15.days.from_now.strftime('%Y-%m-%d %H:%M'), forth_max: 1.month.from_now.strftime('%Y-%m-%d %H:%M'))
      RealTiming.create!(post_id: @post.id)
      flash[:warning] = '投稿完了しました。'
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    else
      flash[:danger] = 'タイトルと内容は必須です。'
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
      flash[:warning] = '更新完了しました。'
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    else
      flash[:danger] = '更新失敗しました。'
      render :edit
    end
  end

  # 投稿の削除
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:warning] = '投稿削除しました。'
      redirect_to user_posts_path(user_id: current_user.id)
    else
      flash[:danger] = '更新失敗しました。'
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :content, :link)
  end

  # 自分と友達以外の投稿情報は見れないように判断するメソッド
  def correct_friend_check
    # このメソッドを通過していれば、特定のビューだけ友達のインスタンスを使用できる
    @friend_user = User.find(params[:user_id])
    # 利用ユーザーと入力されたユーザーのidが同じなら自分のビューを見ることになる
    return if current_user.id == params[:user_id].to_i
    # 友達であればビューを表示させる
    return if Friend.friend_user?(current_user, @friend_user)

    # 自分でも友達でもなければエラーメッセージと共にルートへ飛ばす
    flash[:danger] = '友達でないユーザーの投稿情報は見れないようになっています'
    redirect_to root_path
  end
end
