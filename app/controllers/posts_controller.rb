class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:success] = "約束の投稿が完了しました。"
      redirect_to post_path(@post.id)
    else
       flash[:danger] = "約束の投稿を、失敗しました。"
       render"new"
    end
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
  end
  
  private
  
  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :meeting_at,
      :limit,
      :genre_id,
      :user_id
      )
  end
end
