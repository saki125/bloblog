class LikesController < ApplicationController
  before_action :set_post

  def index
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    @like_list = Post.find(likes)
  end

  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @like.save
  end

  def destroy
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
  end
  
  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end

end
