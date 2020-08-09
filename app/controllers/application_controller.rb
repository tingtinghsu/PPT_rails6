class ApplicationController < ActionController::Base
  #rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private
  def not_found
    render file: '/pubic/404.html', status: 404
  end

  # def user_signed_in?
  #   current_user != nil
    
  # end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_token])
  # end
end
