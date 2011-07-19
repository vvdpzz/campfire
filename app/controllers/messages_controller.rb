class MessagesController < ApplicationController
  
  def create
    cid = params[:channel_id]
    uid = current_user.id
    name = current_user.username
    body = params[:body]
    
    key = "channel:#{params[:channel_id]}.messages"
    score = $redis.incr 'gid'
    
    value = { :id => score, :uid => uid, :name => name, :body => body, :uts => Time.now.to_i }.to_json
    
    $redis.zadd(key, score, value)
    
    Pusher["channel_#{params[:channel_id]}"].trigger('message-create', value)
    render :nothing => true
  end
  
end
