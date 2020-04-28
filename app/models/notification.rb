class Notification < ApplicationRecord
  belongs_to :visitor, class_name: 'User', optional: true
  belongs_to :receiver, class_name: 'User', optional: true
  # nilを許容するため
  belongs_to :plan_timing, optional: true
  # スコープ(新着順)
  default_scope { order(created_at: :desc) }

  validates :visitor_id, numericality: { only_integer: true }, allow_blank: true
  validates :receiver_id, numericality: { only_integer: true }, allow_blank: true
  validates :plan_timing_id, numericality: { only_integer: true }, allow_blank: true
  validates :term_num, numericality: { only_integer: true, greater_than: 0, less_than: 5 }, allow_blank: true
  validates :action, presence: true, inclusion: { in: %w[plan_timing request approve] }
  validates :checked, inclusion: { in: [true, false] }
end
