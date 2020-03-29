class PlanTimingsController < ApplicationController
  # 予定通知時間を編集画面
  def edit
    @plan_timing = Form::PlanTiming.find_by(post_id: params[:post_id])
  end

  # 通知時間の更新
  def update
    @plan_timing = PlanTiming.find_by(post_id: params[:post_id])
    # 分解した値を結合するメソッドをモデルに記載
    changed_data = PlanTiming.date_connection(plan_timing_params, params[:post_id])
    if changed_data.empty?
      flash[:notice] = '変更可能な範囲で選択してください'
    elsif changed_data[:hoge] == 'hoge'
      flash[:alert] = '空白での編集はできません'
    elsif @plan_timing.update!(changed_data)
      flash[:notice] = '更新できました'
    else
      flash[:alert] = '更新失敗しました'
    end
    redirect_to request.referer
  end

  private

  def plan_timing_params
    params.require(:form_plan_timing).permit(Form::PlanTiming::REGISTRABLE_ATTRIBUTES)
  end
end
