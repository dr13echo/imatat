class ProjectsController < ApplicationController

  protect_from_forgery except: :update

  def index
  end

  def new
    @project = Project.new

    if company_signed_in?
      @dest_companies = Company.where(status: 'public').reject(id: current_company.id)
    else
      @dest_companies = Company.where(status: 'public')
    end
  end

  def create
    @project = Project.new(project_params)
    if company_signed_in?
      @project.source_company_id = current_company.id
    else
      @project.source_company_id = Company.first.id
    end
    if @project.save
      flash[:success] = "making project is success!"
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @comment = @project.comments.build
    @source_company = Company.where(id: @project.source_company_id).first

    neg_companies = []
    Comment.where(project_id: params[:id]).all.each do |comment|
      neg_companies << Company.where(id: comment.company_id).first
    end
    @neg_companies = neg_companies.uniq

  end

  def order_index
    if company_signed_in?
      one = Project.where(source_company_id: current_company.id).order(:id)
    else
      one = Project.all.order(:id)
    end

    if one.search(params[:q])
      @q        = one.search(params[:q])
      @projects = @q.result(distinct: true)
    else
      @projects = one.where(status: 'public').all
    end
  end

  def receive_index
    if company_signed_in?
      one = Project.where(dest_company_id: current_company.id || nil).order(:id)
    else
      one = Project.all.order(:id)
    end

    if one.search(params[:q])
      @q        = one.search(params[:q])
      @projects = @q.result(distinct: true)
    else
      @projects = one.where(status: 'public').all
    end
  end

  def edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to order_projects_path
  end

  private

  def project_params
    params.require(:project).permit(
      :source_company_id,
      :dest_company_id,
      :status,
      :name,
      :body,
      :kind_body,
      :kind_edge,
      :need_amount,
      :deadline,
      :estimated_sum,
      :note
    )
  end
end
