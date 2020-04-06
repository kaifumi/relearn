module HomesHelper
  # 小数点部分を時間計算してを返すメソッド
  # %1することで小数点部分のみに24かけて時間を出す
  def divide(float_term)
    (float_term / 3600 % 1 * 24).round
  end

  # 少数点を分計算して返す
  # %1することで小数点部分のみに60かけて分を出す
  def divide_minute(float_term)
    (float_term / 3600 * 24 % 1 * 60).round
  end

  # # 該当するジャンルの投稿が何件あるかチェックするメソッド
  # # [ジャンル1,投稿3件],[ジャンル2,投稿5件]みたいな感じでほしい
  # def item_counts(posts, genres)
  #   i = 1
  #   count_array = []
  #   genres.each do |genre|
  #     post_array = []
  #     posts.each do |post|
  #       # 投稿のジャンルと一致するジャンルを判別する
  #       if post[3] == genre
  #         # 一致したものを配列に挿入する
  #         post_array.push(post[0])
  #       end
  #     end
  #     count_array.push([i, post_array.length])
  #     i += 1
  #   end
  #   # [ジャンル順番,該当の投稿件数]の配列の集合をかえす
  #   count_array
  # end
end
