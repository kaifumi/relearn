class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :relearn_points, dependent: :destroy
  has_many :plan_timings, dependent: :destroy
  has_many :real_timings, dependent: :destroy

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :genre_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true, length: { in: 1..50 }
  validates :content, presence: true, length: { in: 1..10_000 }
  validates :link, length: { in: 1..1000 }, allow_blank: true
  validates :relearn_count, numericality: { only_integer: true, greater_than: -1, less_than: 5 }
  validates :relearn_complete, inclusion: { in: [true, false] }
  validates :total_point, numericality: { only_integer: true, greater_than: -1 }

  # 投稿の中で未復習でかつ最短の通知時間の投稿を振り分けるメソッド
  def self.latest_relearn(posts, _user_id)
    # 直近の未復習が何ターム目を判断し配列に入れる
    yet_relearn = []
    posts.each do |post|
      # 投稿の復習カウントが0回なら予定復習投稿を全部配列に追加
      if post.relearn_count.zero?
        yet_relearn.push({ term: post.plan_timings[0][:first_term], term_num: 1, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
        yet_relearn.push({ term: post.plan_timings[0][:second_term], term_num: 2, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
        yet_relearn.push({ term: post.plan_timings[0][:third_term], term_num: 3, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
        yet_relearn.push({ term: post.plan_timings[0][:forth_term], term_num: 4, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
      # 投稿の復習カウントが1回なら2~4の復習を配列に追加
      elsif post.relearn_count == 1
        yet_relearn.push({ term: post.plan_timings[0][:second_term], term_num: 2, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
        yet_relearn.push({ term: post.plan_timings[0][:third_term], term_num: 3, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
        yet_relearn.push({ term: post.plan_timings[0][:forth_term], term_num: 4, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
      # 投稿の復習カウントが2回なら3,4の復習を配列に追加
      elsif post.relearn_count == 2
        yet_relearn.push({ term: post.plan_timings[0][:third_term], term_num: 3, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
        yet_relearn.push({ term: post.plan_timings[0][:forth_term], term_num: 4, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
      # 投稿の復習カウントが3回なら4のみ復習を配列に追加
      elsif post.relearn_count == 3
        yet_relearn.push({ term: post.plan_timings[0][:forth_term], term_num: 4, post_id: post.id,
                           genre_type: post.genre.type, title: post.title, content: post.content })
      end
    end
    # 投稿の未復習の通知タイミング順にソートした配列
    order_terms = yet_relearn.sort_by! { |a| a[:term] }
    post_array = []
    # post_idを持った配列を作成
    order_terms.each do |order_term|
      post_array.push([order_term[:post_id], order_term[:term_name], order_term[:term],
                       order_term[:genre_type], order_term[:title], order_term[:content]])
    end
    # order_termsの配列をジャンルごとに並べて変数化
    # {{genre_id:[投稿の集合]},{genre_id:[投稿の集合],・・・}のようになっている
    genre_group = order_terms.group_by { |x| x[:genre_type] }
    # ここでまとめて最短の投稿を持つジャンルごとにソートした配列も用意する
    genre_array = []
    # each文でジャンルのtypeの入った配列を作成
    genre_group.each do |genre_hash|
      genre_array.push(genre_hash.first)
    end
    # 通知の早いもの順でソートされている投稿の集合とジャンルの集合を配列化して返す
    # post_arrayは[[post_id,first_term,term,genre_type,title,content],[]...]の形で送る。
    # genre_arrayは["type","type",...]の形で送る
    [post_array, genre_array]
  end
end
