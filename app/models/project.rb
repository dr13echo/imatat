class Project < ActiveRecord::Base

  extend Enumerize
  enumerize :status, in: [:public, :private, :closed]


  has_many :comments
  has_many :commitments

  belongs_to :company # source_company

  def source_company_name; Company.where(id: source_company_id).first.name; end
  def dest_company_name; Company.where(id: dest_company_id).first.name; end

  # validates :source_company_id,          presence: true
  # validates :dest_company_id,          presence: true
  # validates :status,              presence: true
  # validates :name,                presence: true
  # validates :body,                presence: true
  # validates :kind_body,           presence: true
  # validates :kind_edge,           presence: true
  # validates :need_amount,         presence: true
  # validates :deadline,            presence: true
  # validates :estimated_sum,       presence: true
  # validates :note,                presence: true
end
