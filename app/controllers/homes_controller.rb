class HomesController < ApplicationController
  # トップページの表示
  def top
    # もしログインしていたら合計得点と平均復習率を取得
    if user_signed_in?
      @total_point = TotalPoint.find_by(user_id: current_user).score
      @user_rate = Rate.find_by(user_id: current_user)
      # 平均復習率を計算して表示
      @user_rate.total_rate = 1 if @user_rate.total_rate > 1
      @average_rate = @user_rate.total_rate / @user_rate.count if @user_rate.count >= 4
      @posts = Post.where(user_id: current_user.id, relearn_complete: false)
      # 投稿の中で未復習でかつ最短の通知時間の投稿を振り分けるメソッド
      order_array = Post.latest_relearn(@posts, current_user.id)
      # idと何ターム目かとターム、ジャンル名、タイトル、内容の配列
      @order_posts = order_array[0]
      # ジャンル名の配列
      @genres = order_array[1]
    end
    # pluckメソッドで単一のランダムレコードをもってくる
    @quote = Quote.find(Quote.pluck(:id).sample).word
  end

  # アバウトページの表示
  def about; end
end
