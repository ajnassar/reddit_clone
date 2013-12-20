class SubsController < ApplicationController

  def create
    @sub = Sub.new(params[:sub])
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to user_url(@sub.moderator)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @user = @sub.moderator
    @sub.destroy
    redirect_to user_url(@user)
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(params[:sub])
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def new
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end
end
