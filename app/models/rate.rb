class Rate < ApplicationRecord
  belongs_to :user

  # バリデーション
  validates :count, numericality: { only_integer: true, greater_than: -1 }

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

  # usersにはランキング掲載不可能なユーザーが複数レコード入っている
  # total_pointsには合計得点のスコアが複数レコード入っている
  def self.exclude(users, rates)
    user_array = []
    # userのidだけで配列化する
    users&.each do |user|
      user_array.push(user[:id])
    end
    rate_array = []
    # 除外したいユーザーと被らなければ配列に入れる
    rates.each.with_index(1) do |rate, i|
      if user_array.include?(rate[:user_id])
        next
      # 最高で50人入れるまで繰り返す
      elsif i <= 50
        rate_array.push(rate)
      end
    end
    rate_average_array = []
    # 並べてから平均値を計算したら順位が変動するため、ここで平均値を出して並べる
    rate_array.each do |rate|
      # 平均値を出す
      average_rate = rate[:total_rate] / rate[:count]
      # user_idと平均値の配列が入った配列をつくる。小数点が第2位まで。
      rate_average_array.push(user_id: rate[:user_id], average_rate: average_rate.floor(2))
    end
    # 平均値の高い順で並び替え
    rate_average_array.sort_by { |x| x[:average_rate] }.reverse
  end

  # 友達と自分の合計ポイントが高い順の配列を作るメソッド
  def self.sorting(friends, current_user_id)
    # 復習率の配列を用意
    rate_array = []
    if friends.present?
      friends.each do |friend|
        # リクエスト送信者が自分の場合、その友達はリクエスト受信者
        if friend.sender_id == current_user_id
          rate_array.push(Rate.find_by(user_id: friend.recipient_id))
        # リクエスト受信者が自分の場合、その友達はリクエスト送信者
        elsif friend.recipient_id == current_user_id
          rate_array.push(Rate.find_by(user_id: friend.sender_id))
        end
      end
    end
    # 最後に自分を入れる
    rate_array.push(Rate.find_by(user_id: current_user_id))
    # 平均化した復習率順の配列
    rate_average_array = []
    # 平均復習率を計算するeach文
    rate_array.each do |rate|
      # total_rateが0.0の場合はzero?メソッドで判断できる
      if rate[:total_rate].zero?
        # 復習回数0であれば平均値は0とする
        rate_average_array.push(user_id: rate[:user_id], average_rate: 0.floor(2))
      else
        # 平均値を出す
        average_rate = rate[:total_rate] / rate[:count]
        rate_average_array.push(user_id: rate[:user_id], average_rate: average_rate.floor(2))
      end
    end
    # 平均値の高い順で並び替え
    rate_average_array.sort_by { |x| x[:average_rate] }.reverse if rate_average_array.present?
  end
end
