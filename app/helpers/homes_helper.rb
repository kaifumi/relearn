module HomesHelper
  # 小数点のみを返すメソッド
  def divide(float_term)
    _a, b = float_term.to_s.split('.')
    # 小数点のみを返す
    b
  end

  # 少数点を分計算して返す
  def divide_minute(float_term)
    _a, b = float_term.to_s.split('.')
    # 小数点のみを返す
    b.to_i * 60 / 10
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
