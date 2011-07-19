class Channel < ActiveRecord::Base
  
  has_many :docs
  
  def messages_from_redis
    $redis.zrange("channel:#{self.id}.messages", 0, -1)
  end
  
end
