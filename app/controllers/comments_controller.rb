class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @link = Link.find(params[:link_id])
    if @comment.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to links_url(@link)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @link = @comment.link
    @comment.destroy
    redirect_to link_url(@link)
  end

  def update
    @comment = Comment.find(params[:id])
    @link = Link.find(params[:link_id])
    if @comment.update_attributes(params[:comment])
      redirect_to link_url(@link)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to links_url(@link)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
end
