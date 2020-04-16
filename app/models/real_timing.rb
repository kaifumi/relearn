class RealTiming < ApplicationRecord
  belongs_to :post

  # バリデーション
  validates :post_id, presence: true, numericality: { only_integer: true }

  # 受け取った値がどの復習タイミングか判別するメソッド
  def self.check(received_score)
    # 復習番目と復習予定時間の配列を用意
    terms = [%w[first_score first_term], %w[second_score second_term], %w[third_score third_term], %w[forth_score forth_term]]
    terms.each do |term|
      next unless received_score[term[0]] == 'true'

      # 配列化
      array_term = [term[1], Time.zone.now]
      # ハッシュ化
      hash_term = Hash[*array_term]
      return hash_term
    end
  end
end
