class RealTiming < ApplicationRecord
  belongs_to :post

  # 受け取った値がどの復習タイミングか判別するメソッド
  def self.check(received_score)
    # 復習番目と復習予定時間の配列を用意
    terms = [%w[first_score first_term], %w[second_score second_term], %w[third_score third_term], %w[forth_score forth_term]]
    # each文内でautoincrementさせる用
    i = 1
    terms.each do |term|
      if received_score[term[0]] == 'true'
        # 配列化
        array_term = [term[1], Time.zone.now]
        # ハッシュ化
        hash_term = Hash[*array_term]
        return hash_term
      end
      i += 1
    end
  end
end
