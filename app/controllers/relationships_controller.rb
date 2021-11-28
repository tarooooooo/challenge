class RelationshipsController < ApplicationController
  before_action :redirect_root
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def redirect_root
    unless logged_in?
      flash[:success] = "ログインまたは、新規登録を行なってください。"
      redirect_to root_path
    end
  end
end
