module ProjectsHelper
  def calc_post_time_str(created_time)
    time_ago_str = ''
    if (Time.now - created_time).to_i/3600 < 1
      time_ago_str = ((Time.now - created_time).to_i/60).to_s + " minutes"
    else
    time_ago_str = ((Time.now - created_time).to_i/3600).to_s + " hour"
    end
    time_ago_str
  end

  def project_progress_bar(pro)
    amount = 0
    pro.commitments.each do |commitment|
      commitment.amount += amount
    end
    progress = amount / pro.need_amount * 100
    progress.round
  end

  def project_company_status(pro)
    if company_signed_in?
      if pro.comments.where(company_id: current_company.id).present?
        return '交渉中'
      elsif Commitment.where(project_id: pro.id, dest_company_id: current_company.id).present?
        return '契約済み'
      else
        return '未参加'
      end
    else
      if pro.comments.where(company_id: Company.first.id).present?
        return '交渉中'
      elsif Commitment.where(project_id: pro.id, dest_company_id: Company.first.id).present?
        return '契約済み'
      else
        return '未参加'
      end
    end
  end
end
