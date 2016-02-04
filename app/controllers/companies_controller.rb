class CompaniesController < ApplicationController
  def index
    one = Company.where(status: 'public').all

    if one.search(params[:q])
      @q        = one.search(params[:q])
      @companies = @q.result(distinct: true)
    else
      @companies = one
    end
  end

  def show
    @company = Company.find(params[:id])
    @dest_commitments = Commitment.where(dest_company_id: params[:id])
    @source_commitments = Commitment.where(source_company_id: params[:id])
    @reviews = Review.where(dest_company_id: params[:id]).order(:created_at)

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

    gon.score1 = @company.score1
    gon.score2 = @company.score2
    gon.score3 = @company.score3
    gon.score4 = @company.score4
    gon.score5 = @company.score5

  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to root
    else
      render 'new'
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :status, :name, :busyness, :zip, :prefecture, :address, :make_count, :member_count,
      :body, :tel, :email, :password, :image
    )
  end
end
