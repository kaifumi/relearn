class RanksController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!
  # 全体ポイントランキングの表示
  def point_rank
    # ランキング掲載不可の人の集合をつくる
    @exclude_users = User.where(rank_status: false)
    # 合計ポイントが0ではなく、降順に並べる
    @total_points = TotalPoint.where.not(score: 0).order(score: :desc)
    # ランキング掲載したくない人は除くメソッド
    @point_ranks = TotalPoint.exclude(@exclude_users, @total_points)
  end

  # 友達ポイントランキングの表示
  def friend_point_rank
    # 友達になったらランキング掲載不可関係なく表示する
    # 自分が送信か受信したリクエストが承認されていれば友達の集合ができる
    @friends = Friend.where(active_status: true).where('sender_id=? or recipient_id=?', current_user.id, current_user.id)
    # 友達のidを使ってスコアの高い順番に分けるメソッド
    @friend_point_ranks = TotalPoint.sorting(@friends, current_user.id)
  end

  # 全体リズムランキングの表示
  def rhythm_rank
    @exclude_users = User.where(rank_status: false)
    @rates = Rate.where.not(count: 0).order(total_rate: :desc)
    # ランキングに掲載したくない人は除くメソッド
    @rhythm_ranks = Rate.exclude(@exclude_users, @rates)
  end

  # 友達ポイントランキングの表示
  def friend_rhythm_rank
    # 友達になったらランキング掲載不可関係なく表示する
    # 自分が送信か受信したリクエストが承認されていれば友達の集合ができる
    @friends = Friend.where(active_status: true).where('sender_id=? or recipient_id=?', current_user.id, current_user.id)
    # 友達のidを使ってスコアの高い順番に分けるメソッド
    @friend_point_ranks = TotalPoint.sorting(@friends, current_user.id)
  end
end
