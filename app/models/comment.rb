class Comment < ActiveRecord::Base

  extend Enumerize
  enumerize :status, in: [:ok, :ng]
  enumerize :kind, in: [:general, :request]

  belongs_to :company
  belongs_to :project

  after_save :commitment_create

  # validates :project_id,       presence: true
  # validates :company_id,       presence: true
  # validates :kind,             presence: true
  # validates :status,           presence:true
  # validates :body,             presence:true

  private

  def commitment_create
    if self.status == 'ok'
      Commitment.create!(
        project_id: self.project_id,
        source_company_id: self.project.source_company_id,
        dest_company_id: self.company_id,
        status: 'progress',
        body: self.body,
        amount: self.amount
      )
    end
  end

end
