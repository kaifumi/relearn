class WithdrawalComment < ApplicationRecord
  validates :user_id, numericality: { only_integer: true }
  validates :message, presence: true, length: { in: 1..1000 }, allow_blank: true
end
