class TwitterBandit

  require 'twitter'

  def initialize()
    @twttr = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
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
