class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(*params[:user].values)
    if @user
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Invalid Login"
      render :new
    end
  end

  def destroy
    log_out!
  end

  def new
  end
end
