class RelearnPointsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def update
    # モデルメソッドに送るようのparamsの値を持った引数を用意
    received_score = relearn_point_params
    # 受け取った値が何回目の復習でその特典を計算して返す。
    # scoreには{first_score: 100}などが入る
    score = RelearnPoint.calculate(received_score, params[:post_id])
    relearn_point = RelearnPoint.find_by(post_id: params[:post_id])
    # スコアを更新できれば実行する条件分岐
    if relearn_point.update(score)
      post = Post.find(params[:post_id])
      # カウントが４未満なら1足す
      post[:relearn_count] += 1 if post[:relearn_count] < 4
      post.update(relearn_count: post[:relearn_count])
      flash[:warning] = '復習登録に成功しました'
      # 実際に復習したタイミングを保存するために作成済みのレコードを探す
      realtiming = RealTiming.find_by(post_id: params[:post_id])
      # どのタームの復習か判断するメソッドを使ってハッシュで呼び出す
      term = RealTiming.check(received_score)
      # {first_term: 現在時刻}を使って更新する。
      realtiming.update(term)
      # ユーザーの合計得点のレコードを呼び出す
      total_point = TotalPoint.find_by(user_id: current_user.id)
      # ユーザーの合計得点を復習の度に追加する
      # ハッシュから.valuesメソッドで配列状態の値を取り出して、配列番号を指定して値を出す
      total_point.update(score: total_point[:score] + score.values[0])
      # どのタームの復習か判断して遅れ/早まり具合で率を計算するメソッド、回数も返す
      array_rate = Rate.check(received_score, params[:post_id], current_user.id)
      rate = Rate.find_by(user_id: current_user)
      rate.update(total_rate: rate[:total_rate] + array_rate[0], count: array_rate[1])
    else
      flash[:danger] = '復習登録に失敗しました'
    end

    if post[:relearn_count] >= 4
      post.update(relearn_complete: true)
      # and return を使って明示的に早期終了させる
      redirect_to post_complete_path(post_id: params[:post_id]) and return
    end
    redirect_to request.referer
  end

  private

  def relearn_point_params
    params.require(:relearn_point).permit(:post_id, :first_score, :second_score, :third_score, :forth_score)
  end
end
