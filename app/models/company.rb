class Company < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]

  # モジュール
  extend Enumerize
  enumerize :status, in: [:private, :public]
  enumerize :busyness, in: [:highest, :high, :normal, :low, :lowest]
  enumerize :prefecture, in: [:aichi, :ehime, :ibaraki, :okayama, :okinawa, :iwate, :gifu, :miyazaki, :miyagi, :kyoto, :kumamoto, :gunma, :hiroshima, :kagawa, :kochi, :saga, :saitama, :mie, :yamagata, :yamaguchi, :yamanashi, :shiga, :kagoshima, :akita, :niigata, :kanagawa, :aomori, :shizuoka, :ishikawa, :chiba, :osaka, :oita, :nagasaki, :nagano, :tottori, :shimane, :tokyo, :tokushima, :tochigi, :nara, :toyama, :fukui, :fukuoka, :fukushima, :hyogo, :hokkaido, :wakayama]

  # 委譲

  # 関連
  has_many :comments
  has_many :projects
  has_many :commitments
  has_many :reviews

  # バリデーション
  # validates :status,                   presence: true
  # validates :name,                     presence: true
  # validates :busyness,                 presence: true
  # validates :zip,                      presence: true
  # validates :prefecture,               presence: true
  # validates :address,                  presence: true
  # validates :make_count,               presence: true
  # validates :member_count,             presence: true
  # validates :body,                     presence: true
  # validates :tel,                      presence: true
  # validates :email,                    presence: true
  # validates :encrypted_password,       presence: true
  # validates :photo,                    presence: true
  # validates :rate,                     presence: true
  # validates :score1,                   presence: true
  # validates :score2,                   presence: true
  # validates :score3,                   presence: true
  # validates :score4,                   presence: true
  # validates :score5,                   presence: true
  # validates :note,                     presence: true

  # メソッド

end