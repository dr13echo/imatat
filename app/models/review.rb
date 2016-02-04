class Review < ActiveRecord::Base

  # 委譲

  # 関連
  belongs_to :company #source_company(レビューを書く側)
  belongs_to :commitment

  # スコープ

  # フック
  after_save :set_score1, :set_score2, :set_score3, :set_score4, :set_score5, :set_rate

  # バリデーション

  # validates :source_company_id,   presence: true
  # validates :dest_company_id,     presence: true
  # validates :commitment_id,       presence: true
  # validates :title,               presence: true
  # validates :body,                presence: true
  # validates :score1,              presence: true
  # validates :score2,              presence: true
  # validates :score3,              presence: true
  # validates :score4,              presence: true
  # validates :score5,              presence: true

  private

  def set_score1
    company = Company.where(id: self.dest_company_id).first
    if company.present?
      score = 0
      count = 0
      Review.where(dest_company_id: company.id).all.each do |review|
        score += review.score1
        count += 1
      end
      score = score.quo(count).floor(1).to_f
      company.update(score1: score)
    end
  end

  def set_score2
    company = Company.where(id: self.dest_company_id).first
    if company.present?
      score = 0
      count = 0
      Review.where(dest_company_id: company.id).all.each do |review|
        score += review.score2
        count += 1
      end
      score = score.quo(count).floor(1).to_f
      company.update(score2: score)
    end
  end

  def set_score3
    company = Company.where(id: self.dest_company_id).first
    if company.present?
      score = 0
      count = 0
      Review.where(dest_company_id: company.id).all.each do |review|
        score += review.score3
        count += 1
      end
      score = score.quo(count).floor(1).to_f
      company.update(score3: score)
    end
  end

  def set_score4
    company = Company.where(id: self.dest_company_id).first
    if company.present?
      score = 0
      count = 0
      Review.where(dest_company_id: company.id).all.each do |review|
        score += review.score4
        count += 1
      end
      score = score.quo(count).floor(1).to_f
      company.update(score4: score)
    end
  end

  def set_score5
    company = Company.where(id: self.dest_company_id).first
    if company.present?
      score = 0
      count = 0
      Review.where(dest_company_id: company.id).all.each do |review|
        score += review.score5
        count += 1
      end
      score = score.quo(count).floor(1).to_f
      company.update(score5: score)
    end
  end

  def set_rate
    company = Company.where(id: self.dest_company_id).first
    if company.present?
      avg = (self.score1 + self.score2 + self.score3 + self.score4 + self.score5).quo(5).floor(1).to_f
      company.update(rate: avg)
    end
  end

end
