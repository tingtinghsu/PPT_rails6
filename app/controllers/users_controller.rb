class UsersController < ApplicationController
  def home
    
  end
  def sign_up
    @user = User.new
  end

  def create
    #byebug
    user = User.new(user_params)
    if user.save
      sign_in_user(user)
      redirect_to boards_path, notice: '帳號註冊成功！'
    else
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end

  def login
    # Model login的同名方法
    user = User.login(user_params)
    if user
      sign_in_user(user)
      redirect_to home_users_path, notice: "登入成功"
    else
      redirect_to sign_in_users_path, notice: "請輸入正確帳號與密碼"
    end
  end

  def sign_out
    sign_out_user
    redirect_to root_path, notice: '登出成功！'
  end

  private
  def sign_in_user(user)
    session[:user_token] = user.id
  end

  def sign_out_user
    session[:user_token] = nil
  end
  def user_params
    params.require(:user).permit(:account, :password, :email)
  end
end
