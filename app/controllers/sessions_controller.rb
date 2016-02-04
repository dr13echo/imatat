class SessionsController < ApplicationController
  def create
    if company = Company.authenticate(params[:email], params[:encrypted_password])
      session[:company_id] = company.id
      redirect_to root_url
    end
  end

  def destroy
    # @_current_companyとsession[:company_id]の値をnilにする
    @_current_company = session[:company_id] = nil
    redirect_to root_url
  end
end
