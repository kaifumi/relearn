class Friend < ApplicationRecord
  # リレーションシップに対応したidに対してbelongs_toの関連付けを追加する
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
end
