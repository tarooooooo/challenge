class LikesController < ApplicationController
  before_action :redirect_root

 def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post_id: params[:post_id])
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def redirect_root
    unless logged_in?
      flash[:success] = "ログインまたは、新規登録を行なってください。"
      redirect_to root_path
    end
  end
end
