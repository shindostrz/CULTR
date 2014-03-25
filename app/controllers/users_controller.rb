class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    # Fix this part with form helpers
    user.update_attributes(name: params[:user][:name], email: params[:user][:email])
    redirect_to user_path(user.id)
  end

  def create
    user = User.create(params[:user])
    sign_in(user)
    redirect_to user_path(user.id)
  end

  def show
    @user = User.find(params[:id])
  end
end
