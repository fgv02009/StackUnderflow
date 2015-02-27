class SessionsController < ApplicationController
  def new #login
    @user = User.new
  end

  def create #post login
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/"
    else
      @user = User.new
      render "new"
    end
  end

  def destroy #logout
    session[:user_id] = nil
    redirect_to "/"
  end
end
