class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end
end
