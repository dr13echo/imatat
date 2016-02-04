class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if company_signed_in?
      @review.update(source_company_id: current_company.id)
    else
      @review.update(source_company_id: Company.first.id)
    end
    @review.update(dest_company_id: @review.commitment.dest_company_id)

    if @review.save
      redirect_to commitments_url
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :source_company_id, :dest_company_id, :commitment_id, :body,
      :score1, :score2, :score3, :score4, :score5
    )
  end
end
