class Companies::RegistrationsController < Devise::RegistrationsController
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to root_url
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