class ApplicationController < ActionController::Base
  #rescue_from ActiveRecord::RecordNotFound, with: :not_found
  helper_method :user_signed_in?, :current_user

  private
  def not_found
    render file: '/pubic/404.html', status: 404
  end


  # current_user, 有可能是空值，或者已有session
  def current_user
    @current_user ||= User.find_by(id: session[:user_token])
  end

  # 正在用這個網站的使用者已經有登入
  def user_signed_in?
    current_user != nil
  end

  # 沒登入的使用者，遇到需要驗證身份的功能就轉址
  def authenticate_user!
    redirect_to root_path, notice: '請登入會員' if not user_signed_in?
  end
end
