class Channel < ActiveRecord::Base
  
  has_many :docs
  has_many :pages
  def messages_from_redis
    $redis.zrange("channel:#{self.id}.messages", 0, -1)
  end
  
end
