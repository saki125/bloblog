class UsersController < ApplicationController
  def show
    @posts = current_user.posts
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
           redirect_to root_path
    end
  end
  
  def update
    if current_user.update(user_params)
          redirect_to user_path(current_user)
    else
           redirect_to edit_user_path(current_user)
    end
  end
end
