module HomesHelper
  include PostsHelper
  # 残り何時間か返すメソッド
  # 例 (111111.11秒 * 1分/60秒 * 1時間/60分 % 24時間 = 6.864...時間).round = 7時間
  def divide(diff_time)
    (diff_time / 3600 % 24).round
  end

  # 残り何分か返すメソッド
  # 例 (222222.22秒 * 1分/60秒 * 1時間/60分 % 1時間 * 60分/時間 = 51.85...分).round = 52分
  def divide_minute(diff_time)
    (diff_time / 3600 % 1 * 60).round
  end

  # 復習リズムを小数点かつ0以上1以下で返す
  def average_rate(current_user)
    user_rate = Rate.find_by(user_id: current_user.id)
    # 復習回数が0なら0.00を返す
    if user_rate.count.zero?
      format('%<rate>.2f', rate: user_rate.total_rate)
    else
      # 平均復習率を計算して0.93のように返す
      format('%<rate>.2f', rate: user_rate.total_rate / user_rate.count)
    end
  end

  # 現在時刻が通知時間よりも後の場合にtrueを返すメソッド
  def check_timing_bool(plan_timing, relearn_count, time_now)
    if relearn_count.zero?
      return true if plan_timing.first_term <= time_now
    elsif relearn_count == 1
      return true if plan_timing.second_term <= time_now
    elsif relearn_count == 2
      return true if plan_timing.third_term <= time_now
    elsif relearn_count == 3
      return true if plan_timing.forth_term <= time_now
    else
      false
    end
    false
  end
end
