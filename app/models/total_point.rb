class TotalPoint < ApplicationRecord
  belongs_to :user

  # usersにはランキング掲載不可能なユーザーが複数レコード入っている
  # total_pointsには合計得点のスコアが複数レコード入っている
  def self.exclude(users, total_points)
    user_array = []
    # userのidだけで配列化する
    users&.each do |user|
      user_array.push(user[:id])
    end

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
end
