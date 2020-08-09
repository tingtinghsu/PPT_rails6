module UsersHelper
    # # 使用者登入 => 給 session
    # def user_signed_in?
    #   session[:user_token]
    # end
  
    # # current_user: 如果有session，就去找這個session是哪位user的
    # def current_user
    #   User.find(session[:user_token]) if user_signed_in?
    # end
    def authorized_user_for_post?(user_id)
        user_signed_in? && (user_id == current_user.id)
    end
end
