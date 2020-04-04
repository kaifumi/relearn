class TotalPoint < ApplicationRecord
  belongs_to :user

  # usersにはランキング掲載不可能なユーザーが複数レコード入っている
  # total_pointsには合計得点のスコアが複数レコード入っている
  def self.exclude(users, total_points)
    # 掲載不可の人の集合
    user_array = []
    # userのidだけで配列化する
    users&.each do |user|
      user_array.push(user[:id])
    end

    # 合計スコアの集合
    total_point_array = []
    i = 0
    # 除外したいユーザーと被らなければ配列に入れる
    total_points.each do |total_point|
      if user_array.include?(total_point[:user_id])
        next
      # 最高で50人入れるまで繰り返す
      elsif i <= 50
        total_point_array.push(total_point)
        i += 1
      end
    end
    total_point_array
  end

  # 友達と自分の合計ポイントが高い順の配列を作るメソッド
  def self.sorting(friends, current_user_id)
    # 合計ポイントの配列を用意
    total_point_array = []
    friends.each do |friend|
      # リクエスト送信者が自分の場合、その友達はリクエスト受信者
      if friend.sender_id == current_user_id
        total_point_array.push(TotalPoint.find_by(user_id: friend.recipient_id))
      # リクエスト受信者が自分の場合、その友達はリクエスト送信者
      elsif friend.recipient_id == current_user_id
        total_point_array.push(TotalPoint.find_by(user_id: friend.sender_id))
      end
    end
    # 最後に自分を入れる
    total_point_array.push(TotalPoint.find_by(user_id: current_user_id))
    # ポイントの高い順に並び替える
    total_point_array.sort_by { |x| x[:score] }.reverse
  end
end
