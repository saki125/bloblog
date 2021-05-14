class LikesController < ApplicationController
  before_action :set_post
  def create
    #  binding.pry
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    # binding.pry
    @like.save
    # render json:{ like: like }
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
