class SessionsController < ApplicationController
  def new
  end
  
  # POST /login
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if !@user.nil? && @user.authenticate(params[:session][:password])
      flash[:success] = "ログインに成功しました!"
      log_in(@user)
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "メールアドレスまたはパスワードを間違えています"
      render 'new'
    end
  end
end
