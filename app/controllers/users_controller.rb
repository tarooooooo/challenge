class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @not_image = "no_image.jpg"
  end

  def new
    @user = User.new
    @not_image = "no_image.jpg"
  end

  def create
    @user = User.new(user_params)
    @user.deleted = false
    if @user.save
      flash[:success] = "登録が完了しました"
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

  def edit
  end

  def update
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
      :icon_image_id
      )
  end
end
