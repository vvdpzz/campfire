class DocsController < ApplicationController
  def create
    channel = Channel.find params[:channel_id]
    @doc = channel.docs.build(:src => params[:Filedata], :user_id => current_user.id)
    if @doc.save
      
      filename = File.basename(@doc.src.url)
      
      value = { :id => @doc.id, :uid => current_user.id, :src => @doc.src.url, :filename => filename, :name => current_user.username }.to_json

      Pusher["presence-channel_#{params[:channel_id]}"].trigger('doc-create', value)
      
      render :json => { :status => 'success', :id => @doc.id, :uid => current_user.id, :src => @doc.src.url, :filename => filename, :name => current_user.username }.to_json
    end
  end
  
  def destroy
    @doc = current_user.docs.find(params[:id])
    filename = File.basename(@doc.src.url)
    channel_id = @doc.channel.id
    value = { :id => @doc.id, :uid => current_user.id, :src => @doc.src.url, :filename => filename, :name => current_user.username }.to_json
    @doc.destroy
    Pusher["presence-channel_#{channel_id}"].trigger('doc-destroy', value)
  end
end
