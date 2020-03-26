class HomesController < ApplicationController
  # トップページの表示
  def top
    # もしログインしていたら合計得点を取得
    @total_point = TotalPoint.find_by(user_id: current_user).score if user_signed_in?
  end

  # アバウトページの表示
  def about; end
end
