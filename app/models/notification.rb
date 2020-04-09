class Notification < ApplicationRecord
  belongs_to :visitor, class_name: 'User', optional: true
  belongs_to :receiver, class_name: 'User', optional: true
  # nilを許容するため
  belongs_to :plan_timing, optional: true
  # スコープ(新着順)
  default_scope { order(created_at: :desc) }
end
