class CommentsController < ApplicationController

  protect_from_forgery except: :update

  def show
  end

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    if @comment.save
      flash[:success] = "making comment is success!"
      redirect_to(:back)
    else
      raise ArgumentError
      flash[:failed] = "making comment is failed"
      redirect_to(:back)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(status: 'ok')
      flash[:success] = "Comment updated"
      redirect_to @comment.project
    else
      redirect_to(:back)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :project_id,
      :company_id,
      :kind,
      :status,
      :body,
      :amount
    )
  end
end
