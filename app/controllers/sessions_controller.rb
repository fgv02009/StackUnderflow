class SessionsController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email].try(:authenticate, params[:password]))
    if @user
      session[:user_id] = @user.id
