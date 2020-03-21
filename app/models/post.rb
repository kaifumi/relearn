class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :notifications, dependent: destroy
  has_many :checks, dependent: destroy
  has_many :relearn_points, dependent: destroy
  has_many :plan_timings, dependent: destroy
  has_many :real_timings, dependent: destroy
end
