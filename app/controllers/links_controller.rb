class LinksController < ApplicationController
  def create
    @link = Link.new(params[:link])
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def destroy
    @link = Link.find
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
    @link = Link.find(params[:id])
  end

  def update
  end
end
