class RelearnPointsController < ApplicationController
  def update
    # byebug
    @relearn_point = ReleanPoint.find_by(post_id: params[:post_id])
    @relearn_point.first_score = 100 if first_score.true?
    @relearn_point.update(relearn_point_params)
    redirect_back
  end

  private

  def relearn_point_params
    params.require(:relearn_point).permit(:post_id, :first_score, :second_score, :third_score, :forth_score)
  end
end
