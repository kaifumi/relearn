class PlanTiming < ApplicationRecord
  belongs_to :post
  has_many :notification, dependent: destroy
end
