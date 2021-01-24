class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :destroy]
  before_action :if_user, only:[:edit, :update, :destroy]

  def show
    @posts = current_user.posts.order(created_at: :desc)
  end

  def edit
    
  end
  
  def update
    if @user.update(user_params)
          redirect_to user_path(@user)
    else
          render :edit
    end
  end

  def destory
    if @user.destroy 
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:introduction,:image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def if_user
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end
