class SessionsController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
    # user = User.find_by_email(params[:user][:email])
    # if user && user.authenticate(params[:user][:password])
    #   sign_in(user)
    #   redirect_to root_path
    # else
    #   redirect_to new_session_path
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    # sign_out
    # redirect_to new_session_path
  end

end
