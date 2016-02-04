class CommitmentsController < ApplicationController

  protect_from_forgery except: :update

  def index
    if company_signed_in?
      @dest_commitments = Commitment.where(dest_company_id: current_company.id).all
      @source_commitments = Commitment.where(source_company_id: current_company.id).all
    else
      @dest_commitments = Commitment.where(dest_company_id: 1).all
      @source_commitments = Commitment.where(source_company_id: 1).all
    end

  @review = Review.new
  end

  def create
    @commitment = Commitment.new(commitment_params)
  end

  def edit
  end

  def update
    @commitment = Commitment.find(params[:id])
    if @commitment.update(status: 'done')
      flash[:success] = "Commitment updated"
      redirect_to commitments_url
    else
      redirect_to(:back)
    end
  end

  private

  def commitment_params
    params.require(:commitment).permit(
      :project_id, :source_company_id, :dest_company_id, :amount, :status, :body
    )
  end
end
