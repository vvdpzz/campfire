class DocsController < ApplicationController
  def create
    puts "balabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabala"
    channel = Channel.find params[:channel_id]
    @doc = channel.docs.build(:src => params[:Filedata], :user_id => current_user.id)
    if @doc.save
      render :json => { :status => 'success', :src => @doc.src.url }.to_json
    end
  end
end
