class DashboardController < ApplicationController
  def index
    if company_signed_in?
      @source_projects = Project.where(source_company_id: current_company.id, status: 'public')
      @dest_projects = Project.where(dest_company_id: current_company.id || nil, status: 'public')
      @reviews = current_company.reviews.order(:created_at).reverse_order.limit(10)
    else
      @source_projects = Project.all
      @dest_projects = Project.all
      @reviews = Review.order(:created_at).reverse_order.limit(10)
    end

    score1 = 0
    score2 = 0
    score3 = 0
    score4 = 0
    score5 = 0

    Review.all.each do |review|
      score1 += review.score1
      score2 += review.score2
      score3 += review.score3
      score4 += review.score4
      score5 += review.score5
    end

    gon.avg1 = score1.quo(Review.count).floor(1).to_f
    gon.avg2 = score2.quo(Review.count).floor(1).to_f
    gon.avg3 = score3.quo(Review.count).floor(1).to_f
    gon.avg4 = score4.quo(Review.count).floor(1).to_f
    gon.avg5 = score5.quo(Review.count).floor(1).to_f

    if company_signed_in?
      gon.score1 = current_company.score1
      gon.score2 = current_company.score2
      gon.score3 = current_company.score3
      gon.score4 = current_company.score4
      gon.score5 = current_company.score5
    else
      gon.score1 = Company.first.score1
      gon.score2 = Company.first.score2
      gon.score3 = Company.first.score3
      gon.score4 = Company.first.score4
      gon.score5 = Company.first.score5
    end
  end
end
