class SessionsController < ApplicationController
  def new #login
    @user = User.new
  end

  def create #post login
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/articles"
    else
      render "new"
    end
  end

  def destroy #logout
    session[:user_id] = nil
    render "new"
  end
end
