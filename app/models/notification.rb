class Notification < ApplicationRecord
  belongs_to :visiter, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :post
  belongs_to :plan_timing

  # スコープ(新着順)
  default_scope -> { order(created_at: :desc) }
end
