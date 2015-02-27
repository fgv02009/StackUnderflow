class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    if @user = login(params[:username], params[:password], params[:remember])
      redirect_back_or_to '/', notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to "/", notice: 'Logged out!'
  end
end
