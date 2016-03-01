class CommentsController < ApplicationController
  def new
    bathroom = Bathroom.find(params[:bathroom_id])
    @comment = bathroom.comments.new
  end

  def create
    if logged_in?
      bathroom = Bathroom.find(params[:bathroom_id])
      @comment = bathroom.comments.new(comment_params)
      @comment.user_id = session[:user_id]
      if @comment.save
        redirect_to bathroom_path(bathroom)
      else
        render :new
      end
    else
      redirect_to '/login'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    unless @comment.user.id == session[:user_id]
      redirect_to "/login"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if logged_in? && @comment.user.id == current_user.id
      if @comment.update(comment_params)
        redirect_to
      else
        render :new
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if logged_in? && @comment.user.id == current_user.id
      @comment.destroy
      redirect_to bathroom_path(@comment.bathroom)
    else
      redirect_to '/login'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
