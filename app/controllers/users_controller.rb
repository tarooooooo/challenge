class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @not_image = "no_image.jpg"
    @tags = @user.tags

    @rooms = @user.rooms
    @like_posts = current_user.liked_posts
    @before_posts =[]
    @after_posts = []
    @rooms.each do |room|
      @before_posts << room.post if room.post.meeting_at > Time.current
      @after_posts << room.post if room.post.meeting_at <= Time.current
    end
  end

  def new
    @user = User.new
    @user.tag_relationships.build
  end

  def create
    @user = User.new(user_params)
    @user.deleted = false
    if @user.save

      if params[:user][:icon_image]
         File.binwrite("public/user_images/#{@user.id}.jpg", params[:user][:icon_image].read)
         @user.update(icon_image_id: "#{@user.id}.jpg" )
      else
         @user.update(icon_image_id: "no_image.jpg" )
      end

      log_in(@user)
      flash[:success] = "登録が完了しました！"
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

      if params[:user][:icon_image]
         File.binwrite("public/user_images/#{@user.id}.jpg", params[:user][:icon_image].read)
         @user.update(icon_image_id: "#{@user.id}.jpg" )
      end

      flash[:success] = "保存が完了しました。"
      redirect_to user_path(@user)
    else
      flash[:danger] = "保存が失敗しました。"
      render 'edit'
    end
  end

  def search
    @tags = Tag.all
    @tag = Tag.find_by(name: params[:tag_name])
    @users = @tag.users
  end

  def index
    @tags = Tag.all
    @user_tags = current_user.tags
    @users = []
    @tags.each do |tag|
      tag.users.each do |user|
        @users << user if user != current_user
      end
    end
    @users.uniq!
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :remember_token,
      :deleted,
      :introduction,
      :icon_image_id,
      { :tag_ids=> [] }
      )
  end
end
