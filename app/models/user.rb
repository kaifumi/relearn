class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]
  # refileでイメージ画像を扱えるようにする
  attachment :image
  # 論理削除するために必要
  acts_as_paranoid

  # omniauthのコールバック時に呼ばれるメソッド
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #   end
  # end

  # バリデーション
  validates :name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

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
                                  foreign_key: 'visitor_id',
                                  dependent: :destroy,
                                  inverse_of: :visitor
  # ユーザーから友達リクエスト通知が送られたときの関係
  has_many :passive_notifications, class_name: 'Notification',
                                   foreign_key: 'receiver_id',
                                   dependent: :destroy,
                                   inverse_of: :receiver
  # visitorsという外部キーをactive_notificationsという中間テーブルを通して1対多で関連付ける。sourceは省略してもいける。
  has_many :visitors, through: :active_notifications, source: :receiver
  # visitedという外部キーをもたせる。sourceは省略してもいける。
  # visitorsでは被るのでreceiversにしました。
  has_many :receivers, through: :passive_notifications, source: :visitor

  # 友達検索メソッド
  def self.search(word, current_user_id)
    # 空検索の場合何も返さない
    return nil if word.blank?

    # 名前が一致するものをすべて返す
    User.where(['name LIKE ?', "%#{word}%"]).where(search_status: true).where.not(id: current_user_id)
  end

  # リクエスト通知が送ったときの通知レコードを作成するメソッド
  def self.create_notification_request!(current_user, user_id)
    temp = Notification.where(['visitor_id = ? and receiver_id = ? and action = ? ', current_user.id, user_id, 'request'])
    return if temp.present?

    notification = Notification.new(visitor_id: current_user.id, receiver_id: user_id, action: 'request')
    notification.save if notification.valid?
  end

  # 送ったリクエストが承認されたときの通知レコードを作成するメソッド
  def self.create_notification_approve!(current_user, user_id)
    temp = Notification.where(['visitor_id = ? and receiver_id = ? and action = ? ', user_id, current_user.id, 'approve'])
    return if temp.present?

    notification = Notification.new(visitor_id: current_user.id, receiver_id: user_id, action: 'approve')
    notification.save if notification.valid?
  end

  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)

    user ||= User.create!(
      name: auth.username,
      uid: auth.uid,
      provider: auth.provider,
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )

    user
  end

  def self.dummy_name(auth)
    "#{auth.uid}-#{auth.provider}"
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
