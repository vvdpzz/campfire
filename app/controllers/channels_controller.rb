class ChannelsController < ApplicationController

  def index
    @channels = Channel.all
    channels = @channels.map { |channel| render_to_json channel }
    respond_to do |format|
      format.html
      format.json { render :json => { :channels => channels} }
    end
  end

  def show
    @channel = Channel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @channel }
    end
  end

  def new
    @channel = Channel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @channel }
    end
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def create
    @channel = Channel.new(params[:channel])

    respond_to do |format|
      if @channel.save
        format.html { redirect_to(@channel, :notice => 'Channel was successfully created.') }
        format.xml  { render :xml => @channel, :status => :created, :location => @channel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @channel = Channel.find(params[:id])

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        format.html { redirect_to(@channel, :notice => 'Channel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to(channels_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def render_to_json(obj)
    { :id => obj.id, :name => obj.name }
  end
end
