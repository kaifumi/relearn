class Genre < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :user_id, numericality: { only_integer: true }
  validates :type, presence: true, length: { in: 1..40 }
end
