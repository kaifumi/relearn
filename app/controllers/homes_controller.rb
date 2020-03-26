class HomesController < ApplicationController
  # トップページの表示
  def top
    @total_point = TotalPoint.find_by(user_id: current_user).score
  end

  # アバウトページの表示
  def about; end
end
