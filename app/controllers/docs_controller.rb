class DocsController < ApplicationController
  def create
    channel = Channel.find params[:channel_id]
    @doc = channel.docs.build(:src => params[:Filedata], :user_id => current_user.id)
    if @doc.save
      render :json => { :status => 'success', :src => @doc.src.url, :name => File.basename(@doc.src.url) }.to_json
    end
  end
  
  def destroy
    doc = current_user.docs.find(params[:id])
    doc.destroy
  end
end
