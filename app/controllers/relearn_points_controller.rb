class RelearnPointsController < ApplicationController
  def create
    @relearn_point = ReleanPoint.new(relearn_point_params)
    @relearn_point.save
    redirect_back
  end

  def update
    @relearn_point = ReleanPoint.find(params[:id])
    @relearn_point.update(relearn_point_params)
    redirect_back
  end

  private

  def relearn_point_params
    params.require(:relearn_point).permit(:post_id, :first_score, :second_score, :third_score, :forth_score)
  end
end
