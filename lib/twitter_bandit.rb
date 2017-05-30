class TwitterBandit

  require 'twitter'

  def initialize()
    @twttr = Twitter::REST::Client.new do |config|
      config.consumer_key        = "cBQJhOQ5qzb2U56RkzwZNuXeM"
      config.consumer_secret     = "egGpYk7vCpZkqnoHkJLsw1cAXO6e51N8vhODsF2x4HmbHe517U"
      config.access_token        = "868618482471944192-x4HkGtX3YwycsvQ0OI0QurJtVZaykrl"
      config.access_token_secret = "Vj7JZxhbWCgeFgQ2X5xITUdvwTQ0dBLnpab5h1fDFjz9n"
    end
  end

  def gather_targets(tag, amt)
    final = []
    @twttr.search("#{tag} -rt").take(amt).collect do |tweet|
      final.push tweet.user.screen_name
    end
    return final.uniq
  end

  def follow_targets(tag, amt)
    targets = gather_targets(tag, amt)
    puts "Targets gathered. Waiting 60 seconds for slow drip follow..."
    sleep(60)
    targets.each do |target|
      sleep(70)
      @twttr.follow(target)
      puts "Followed #{target}"
    end
  end

  def tweet(content)
    if Rails.env.production?
      @twttr.update(content)
    end
  end

  def client
    return @twttr
  end

end

# require 'pry'
# @t = TwitterBandit.new()
# Pry.start(binding)
