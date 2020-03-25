class RelearnPointsController < ApplicationController
  def update
    # byebug
    received_score = relearn_point_params
    score = RelearnPoint.calculate(received_score, params[:post_id])
    relearn_point = RelearnPoint.find_by(post_id: params[:post_id])

    if relearn_point.update(score)
      relearn_count = Post.find(params[:post_id])
      relearn_count[:relearn_count] += 1 if relearn_count[:relearn_count] < 5
      relearn_count.update(relearn_count: relearn_count[:relearn_count])
      flash[:notice] = '復習登録に成功しました'
      # 実際に復習したタイミングを保存するために作成済みのレコードを探す
      realtiming = RealTiming.find_by(post_id: params[:post_id])
      # どのタームの復習か判断するメソッドを使ってハッシュで呼び出す
      term = RealTiming.check(received_score)
      # {first_term: 現在時刻}を使って更新する。
      realtiming.update(term)
    else
      flash[:alert] = '復習登録に失敗しました'
    end
    redirect_to request.referer
  end

  private

  def relearn_point_params
    params.require(:relearn_point).permit(:post_id, :first_score, :second_score, :third_score, :forth_score)
  end
end
