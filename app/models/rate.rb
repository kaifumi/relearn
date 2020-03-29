class Rate < ApplicationRecord
  belongs_to :user

  # 受け取った値がどの復習タイミングか判別して遅れ具合の算出メソッド
  def self.check(received_score, post_id, user_id)
    # 復習番目と復習予定時間の配列を用意
    scores = [%w[first_score first_term], %w[second_score second_term], %w[third_score third_term], %w[forth_score forth_term]]
    scores.each do |score|
      next unless received_score[score[0]] == 'true'

      # 復習する予定だった時間と実際の復習時間(現在の時間)の差異(絶対値メソッドabsを使う)の1日あたりの割合を出す
      score_rate = (PlanTiming.find_by(post_id: post_id)[(score[1])] - Time.zone.now).abs / 86_400
      # floorで小数点以下切り捨て、1日遅れるごとに10%マイナスさせる
      relearn_rate = 1 - score_rate.floor * 0.1
      # あまりにも遅れた場合は復習率は0.1にする
      relearn_rate = 0.1 if relearn_rate < 0.1
      # 復習回数も用意する
      rate_count = Rate.find_by(user_id: user_id).count
      rate_count += 1
      # 配列化
      array_rate = [relearn_rate, rate_count]
      return array_rate
    end
  end
end
