class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
    @user = User.new
    @user.build_gender_assignment
  end

  def edit
    @user = User.find(params[:id])
    if @current_user != @user
      redirect_to @current_user
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    sign_in(@user)
    redirect_to @user
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
