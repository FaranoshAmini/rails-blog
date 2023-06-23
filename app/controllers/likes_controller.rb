class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @new_like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    redirect_to users_path if @new_like.save
  end
end
