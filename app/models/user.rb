class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # refileでイメージ画像を扱えるようにする
  attachment :image
  # 論理削除するために必要
  acts_as_paranoid

  has_many :posts, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :total_points, dependent: :destroy
  # has_many :delete_comments, dependent: :destroy
  # 能動関係に対して1対多の関連付け
  has_many :active_relationships, class_name: 'Friend',
                                  foreign_key: 'sender_id',
                                  dependent: :destroy,
                                  inverse_of: :recipient
  # 受動的関係を使ってuser.followersを実装
  has_many :passive_relationships, class_name: 'Friend',
                                   foreign_key: 'recipient_id',
                                   dependent: :destroy,
                                   inverse_of: :sender
  # sendersという外部キーをactive_relationshipsという中間テーブルを通して1対多で関連付ける。sourceは省略してもいける。
  has_many :senders, through: :active_relationships, source: :sender
  # recipientsという外部キーをもたせる。sourceは省略してもいける。
  has_many :recipients, through: :passive_relationships, source: :recipient
  # 通知も友達関係と似たように作る
  # ユーザーが友達リクエスト通知を送ったときの関係
  has_many :active_notifications, class_name: 'Notification',
                                  foreign_key: 'visiter_id',
                                  dependent: :destroy,
                                  inverse_of: :receiver
  # ユーザーから友達リクエスト通知が送られたときの関係
  has_many :passive_notifications, class_name: 'Notification',
                                   foreign_key: 'receiver_id',
                                   dependent: :destroy,
                                   inverse_of: :visiter
  # visitersという外部キーをactive_notificationsという中間テーブルを通して1対多で関連付ける。sourceは省略してもいける。
  has_many :visiters, through: :active_notifications, source: :visiter
  # visitedという外部キーをもたせる。sourceは省略してもいける。
  # visitersでは被るのでreceiversにしました。
  has_many :receivers, through: :passive_notifications, source: :receiver

  # 友達検索メソッド
  def self.search(word, user_id)
    # 空検索の場合何も返さない
    return nil if word.blank?

    # 名前が一致するものをすべて返す
    User.where(['name LIKE ?', "%#{word}%"]).where(search_status: true).where.not(id: user_id)
  end
end
