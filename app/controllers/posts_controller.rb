class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:likes, :comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:likes, :comments).find(params[:id])
    @comments = Comment.where(post: @post)
  end
end
