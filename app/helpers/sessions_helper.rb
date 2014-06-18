module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @current_user ||=
    #   User.find_by_remember_token(cookies[:remember_token])
  end

  def authenticate
    redirect_to new_session_path unless current_user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

end
