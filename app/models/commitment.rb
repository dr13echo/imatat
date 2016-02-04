class Commitment < ActiveRecord::Base
  # モジュール
  extend Enumerize
  enumerize :status, in: [:progress, :done]

  # 委譲

  # 関連
  has_one :review
  belongs_to :company #source_company(依頼する側)
  belongs_to :project

  # スコープ

  # フック

  # バリデーション
  # validates :project_id,       presence: true
  # validates :source_company_id,presence: true
  # validates :dest_company_id,  presence: true
  # validates :amount,           presence: true
  # validates :status,           presence: true
  # validates :body,             presence: true
end
