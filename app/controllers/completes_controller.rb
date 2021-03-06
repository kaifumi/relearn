class CompletesController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!
  # 自分と友達以外の投稿情報は見れない
  before_action :searchable_user_check, only: [:index, :show]

  # 復習完了した投稿の一覧
  def index
    @posts = Post.where(user_id: params[:user_id], relearn_complete: true).page(params[:page])
    @genres = Genre.where(user_id: params[:user_id]).limit(20)
    @plan_timing = Form::PlanTiming.find_by(post_id: params[:id])
    @real_timing = RealTiming.find_by(post_id: params[:id])
  end

  # 復習完了した投稿の詳細
  def show
    @post = Post.find(params[:post_id])
    @genre = Genre.find_by(id: @post.genre_id)
    @plan_timing = PlanTiming.find_by(post_id: params[:post_id])
    @real_timing = RealTiming.find_by(post_id: params[:post_id])
    @relearn_point = RelearnPoint.find_by(post_id: params[:post_id])
  end

  # 復習回数が4回未満で復習完了する場合
  def relearn_complete
    post = Post.find(params[:id])
    if post.update(relearn_complete: true)
      flash[:warning] = '復習ステータスを更新しました'
      redirect_to user_post_complete_path(user_id: current_user.id, post_id: params[:id])
    else
      flash[:danger] = '復習ステータスの更新に失敗しました'
      redirect_to request.referer
    end
  end

  # もう一度復習にする
  def update
    post = Post.find(params[:post_id])
    # 復習完了状態をfalseにする
    post[:relearn_complete] = false
    if post.update(relearn_complete: false, relearn_count: 0, created_at: Time.zone.now)
      plan_timing = PlanTiming.find_by(post_id: params[:post_id])
      plan_timing.update(post_id: post.id, first_term: 1.day.from_now.strftime('%Y-%m-%d %H:%M'),
                         second_term: 3.days.from_now.strftime('%Y-%m-%d %H:%M'), third_term: 10.days.from_now.strftime('%Y-%m-%d %H:%M'),
                         forth_term: 1.month.from_now.strftime('%Y-%m-%d %H:%M'),
                         first_min: 1.hour.from_now.strftime('%Y-%m-%d %H:%M'), first_max: 2.days.from_now.strftime('%Y-%m-%d %H:%M'),
                         second_min: 3.days.from_now.strftime('%Y-%m-%d %H:%M'), second_max: 7.days.from_now.strftime('%Y-%m-%d %H:%M'),
                         third_min: 8.days.from_now.strftime('%Y-%m-%d %H:%M'), third_max: 14.days.from_now.strftime('%Y-%m-%d %H:%M'),
                         forth_min: 15.days.from_now.strftime('%Y-%m-%d %H:%M'), forth_max: 1.month.from_now.strftime('%Y-%m-%d %H:%M'))
      real_timing = RealTiming.find_by(post_id: params[:post_id])
      real_timing.update(post_id: post.id, first_term: '', second_term: '', third_term: '', forth_term: '')
      relearn_point = RelearnPoint.find_by(post_id: params[:post_id])
      relearn_point.update(first_score: 0, second_score: 0, third_score: 0, forth_score: 0)
      flash[:warning] = '復習ステータスを更新しました'
      # もう一度復習するので投稿詳細へとばす
      redirect_to user_post_path(user_id: current_user.id, id: post.id)
    else
      flash[:danger] = '復習ステータスの更新に失敗しました'
      redirect_to request.referer
    end
  end

  # 投稿を削除する
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:warning] = '投稿の削除に成功しました'
    else
      flash[:danger] = '投稿の削除に失敗しました'
    end
    redirect_to request.referer
  end

  private

  # 検索可能者または友達かを判断するメソッド
  def searchable_user_check
    @other_user = User.find(params[:user_id])
    # 利用ユーザーと入力されたユーザーのidが同じなら自分のビューを見ることになる
    return if current_user.id == params[:user_id].to_i
    return if @other_user.search_status
    return if Friend.friend_user?(current_user, @other_user)

    # 友達でないかつ検索負荷の人の場合はエラーメッセージと共にルートへ飛ばす
    flash[:danger] = 'このユーザーの投稿情報は見れないようになっています'
    redirect_to root_path
  end
end
