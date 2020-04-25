class HomesController < ApplicationController
  # トップページの表示
  def top
    # もしログインしていたら合計得点と平均復習率を取得
    if user_signed_in? && Post.find_by(user_id: current_user.id, relearn_complete: false)
      @total_point = TotalPoint.find_by(user_id: current_user).score
      @posts = Post.where(user_id: current_user.id, relearn_complete: false).limit(200)
      # 投稿の中で未復習でかつ最短の通知時間の投稿を振り分けるメソッド
      order_array = Post.latest_relearn(@posts, current_user.id)
      # idと何ターム目かとターム、ジャンル名、タイトル、内容の配列
      @order_posts = order_array[0]
      # ジャンル名の配列
      @genres = order_array[1]
      # グラフ表示用。復習タームの最も近い投稿
      @post = Post.find(@order_posts[0][0])
    end
    # pluckメソッドで単一のランダムレコードをもってくる
    @quote = Quote.find(Quote.pluck(:id).sample).word unless Quote.includes(:word).empty?
  end

  # アバウトページの表示
  def about; end
end
