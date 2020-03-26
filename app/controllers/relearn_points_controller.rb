class RelearnPointsController < ApplicationController
  def update
    # byebug
    received_score = relearn_point_params
    score = RelearnPoint.calculate(received_score, params[:post_id])
    relearn_point = RelearnPoint.find_by(post_id: params[:post_id])

    if relearn_point.update(score)
      post = Post.find(params[:post_id])
      post[:relearn_count] += 1 if post[:relearn_count] < 4
      post.update(relearn_count: post[:relearn_count])
      flash[:notice] = '復習登録に成功しました'
      # 実際に復習したタイミングを保存するために作成済みのレコードを探す
      realtiming = RealTiming.find_by(post_id: params[:post_id])
      # どのタームの復習か判断するメソッドを使ってハッシュで呼び出す
      term = RealTiming.check(received_score)
      # {first_term: 現在時刻}を使って更新する。
      realtiming.update(term)
      TotalPoint.create(user_id: current_user.id) if TotalPoint.find
    else
      flash[:alert] = '復習登録に失敗しました'
    end

    if post[:relearn_count] >= 4
      post.update(relearn_complete: true)
      redirect_to complete_posts_path and return
    end
    redirect_to request.referer and return
  end

  private

  def relearn_point_params
    params.require(:relearn_point).permit(:post_id, :first_score, :second_score, :third_score, :forth_score)
  end
end
