class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # refileでイメージ画像を扱えるようにする
  attachment :image

  has_many :posts, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :notificarions, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :total_points, dependent: :destroy
  has_many :delete_comments, dependent: :destroy
end
