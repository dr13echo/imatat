module DashboardHelper
  def project_progress_bar(pro)
    per = 0
    pro.commitments.each do |commitment|
      per += commitment.amount
    end
    progress = (per / pro.need_amount) * 100
    "#{progress.to_i.round}"
  end

  def review_rate(rev)
    rate = (rev.score1 + rev.score2 + rev.score3 + rev.score4 + rev.score5) / 5
    rate.round(1)
  end
end
