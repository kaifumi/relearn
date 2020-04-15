class Friend < ApplicationRecord
  # リレーションシップに対応したidに対してbelongs_toの関連付けを追加する
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  # バリデーション
  validates :sender_id, presence: true, numericality: { only_integer: true }
  validates :recipient_id, presence: true, numericality: { only_integer: true }
  validates :active_status, inclusion: { in: [true, false] }
  validates :send_request, inclusion: { in: [true, false] }

  # すでにフレンドになっているか確認するメソッド
  def self.friend_user?(current_user, friend_user)
    friend = Friend.where(active_status: true).where('(sender_id=?) or (recipient_id=?)',
                                                     current_user.id, current_user.id).where('(sender_id=?) or (recipient_id=?)', friend_user.id, friend_user.id)
    # friendの中身が空じゃないかつ友達になっているならtrueを返す
    friend[0].present? && friend[0].active_status
  end
end
