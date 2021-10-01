class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = Comment.new(comment_params)
    if @comment.save 
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      return redirect_to post_path(@post)
    end
    render "posts/show"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
