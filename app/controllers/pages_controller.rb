class PagesController < ApplicationController
  
  def new
    @channel = Channel.find params[:channel_id]
    @page = Page.new
  end
  
  def create
    @channel = Channel.find params[:page][:channel_id]
    @page = @channel.pages.build params[:page]
    @page.user_id = current_user.id
    @page.markdown = Helper.markdown(@page.content)
    if @page.save
      redirect_to @page
    else
      render :new
    end
  end
  
  def show
    @page = Page.find params[:id]
  end
  
  def edit
    @page = Page.find params[:id]
    @channel = @page.channel
  end
  
  def update
    @page = Page.find params[:id]
    if @page.update_attributes(params[:page])
      @page.markdown = Helper.markdown(@page.content)
      @page.save
      redirect_to @page
    else
      render :edit
    end
  end
  
  def destroy
    @page = Page.find params[:id]
    @page.destroy
  end
end
