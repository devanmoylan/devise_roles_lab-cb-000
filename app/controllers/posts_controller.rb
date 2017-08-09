class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def show
  end

  def update
    if current_user.user?
      redirect_to root_path
    else
      if @post.update(post_params)
        redirect_to user_path(current_user)
      else
        redirect_to root_path
      end
    end
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end