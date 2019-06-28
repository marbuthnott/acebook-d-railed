# frozen_string_literal: true

require 'pry'

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def index
    @users = User.all
  end

  def new
    redirect_to user_posts_path(current_user) if !current_user.nil?
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Welcome to Acebook by D-Railed!'
      (redirect_to user_posts_path(current_user)) && return
    else
      render :new
    end
  end

  def search
    user = User.find_by_username(user_params[:search])
    if user.nil?
      flash[:search_error] = 'No users found'
      (redirect_to user_posts_path(wall_owner)) && return
    else
      redirect_to user_posts_path(user)
    end
  end

  private

  def wall_owner
    User.find(user_params[:recipient_id])
  end

  def user_params
    params.require(:user).permit(:search, :recipient_id)
  end

  def signup_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
