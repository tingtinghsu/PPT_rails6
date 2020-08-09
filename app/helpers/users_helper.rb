module UsersHelper
    # 檢查使用者有沒有登入
    def user_signed_in?
      session[:user_token]
    end
  
    # 登入的話把session找出來
    def current_user
      User.find(session[:user_token]) if user_signed_in?
    end
end
