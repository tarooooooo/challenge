class PostsController < ApplicationController

  before_action :redirect_root, except: :index

  def index
    @posts = Post.where('meeting_at >= ?', Time.now).order(meeting_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user

    @room = Room.new
    @room.users << current_user
    @meeting_at = @post.meeting_at
  end

  def new
    @post = Post.new
    @post.build_pay_post
    @room = Room.new
    @room.users << current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.meeting_at < Time.current
      flash[:danger] = "約束のお時間は、現時刻以降を、選択してください。"
      redirect_back(fallback_location: root_path)
    else
      if @post.save
        flash.now[:success] = "約束の投稿が完了しました。"
        redirect_to post_path(@post.id)
      else
         flash[:danger] = "約束の投稿を、失敗しました。"
         render"new"
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "編集が完了しました。"
      redirect_to post_path(@post.id)
    else
      flash[:danger] = "保存が失敗しました。"
      render"new"
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = "削除が完了しました。"
      redirect_to posts_path
    else
       flash[:danger] = "削除できませんした。"
      render :edit
    end

  end

  private

  def redirect_root
    unless logged_in?
      flash[:success] = "ログインまたは、新規登録を行なってください。"
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :meeting_at,
      :limit,
      :genre_id,
      :user_id,
      pay_post_attributes: [:id, :price, :_destroy]
      )
  end
end
