class Friend < ApplicationRecord
  # リレーションシップに対応したidに対してbelongs_toの関連付けを追加する
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  # バリデーション
  validates :sender_id, presence: true, numericality: { only_integer: true }
  validates :recipient_id, presence: true, numericality: { only_integer: true }
  validates :active_status, inclusion: { in: [true, false] }
  validates :send_request, inclusion: { in: [true, false] }
end
