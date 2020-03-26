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
    end
    # pluckメソッドで単一のランダムレコードをもってくる
    @quote = Quote.find(Quote.pluck(:id).sample).word
  end

  # アバウトページの表示
  def about; end
end
