module HomesHelper
  include PostsHelper
  # %1することで小数点部分のみに24かけて時間を出す
  def divide(float_term)
    (float_term / 3600 % 1 * 24).round
  end

  # %1することで小数点部分のみに60かけて分を出す
  def divide_minute(float_term)
    (float_term / 3600 * 24 % 1 * 60).round
  end

  # 復習リズムを小数点かつ0以上1以下で返す
  def average_rate(current_user)
    user_rate = Rate.find_by(user_id: current_user.id)
    # 平均復習率を計算して0.93のように返す
    format('%<rate>.2f', rate: user_rate.total_rate / user_rate.count) if user_rate.total_rate > 1
    # 復習回数が0なら0.00を返す
    format('%<rate>.2f', rate: user_rate.total_rate) if user_rate.count.zero?
  end
end
