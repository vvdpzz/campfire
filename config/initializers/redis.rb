$redis = Redis.new(:host => 'localhost', :port => 6379)

User.all.each do |user|
  $redis.set("users:#{user.id}", user.username)
end