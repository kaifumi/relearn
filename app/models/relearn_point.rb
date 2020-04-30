class RelearnPoint < ApplicationRecord
  belongs_to :post

  validates :first_score, numericality: { only_integer: true, greater_than: -1, less_than: 101 }
  validates :second_score, numericality: { only_integer: true, greater_than: -1, less_than: 201 }
  validates :third_score, numericality: { only_integer: true, greater_than: -1, less_than: 301 }
  validates :forth_score, numericality: { only_integer: true, greater_than: -1, less_than: 401 }

  # 受け取った値がどの復習タイミングか判別した上でポイントを計算するメソッド
  def self.calculate(received_score, post_id)
    # 復習番目と復習予定時間の配列を用意
    scores = [%w[first_score first_term], %w[second_score second_term], %w[third_score third_term], %w[forth_score forth_term]]
    scores.each.with_index(1) do |score, i|
      if received_score[score[0]] == 'true'
        # 復習する予定だった時間と実際の復習時間(現在の時間)の差異(絶対値メソッドabsを使う)の1日あたりの割合を出す
        score_rate = (PlanTiming.find_by(post_id: post_id)[(score[1])] - Time.zone.now).abs / 86_400
        # 更新される値の計算式
        # floorで小数点以下切り捨て、1日遅れるごとに10%マイナスさせる
        update_score = (100 * i) - score_rate.floor * 100 * i * 0.1
        update_score = 0 if update_score <= 0
        # 配列化
        array_score = [score[0], update_score.floor]
        # ハッシュ化
        hash_score = Hash[*array_score]
        return hash_score
      # falseなら値に"nilを入れる"
      elsif received_score[score[0]] == 'false'
        hash_score = {}
        return hash_score
      end
    end
  end
end
