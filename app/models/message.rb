class Message < ActiveRecord::Base
  belongs_to :user
  
  def self.insert_to_redis(channel_id, uid, name, body)
    value = { :uid => uid, :name => name, :body => body, :uts => Time.now.to_i }.to_json
    key = "channel:#{channel_id}.messages"
    score = $redis.incr 'gid'
    $redis.zadd(key, score, value)
  end
  
end
