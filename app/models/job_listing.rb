class JobListing < ActiveRecord::Base
  validates_uniqueness_of :source_id, :allow_nil => true, :allow_blank => true

  before_create :generate_details
  after_save :notify_the_world!

  def generate_details
    self.slug = self.job_title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') + "-" + (self.created_at.to_i/10000).to_s
  end

  def activate!
    self.update({active:true})
  end

  def self.generate_from(service)
    scraper = WebScraper.new
    if service == 'workingnomads'
      results = scraper.workingnomads('(category_name.raw:"Marketing")')
      results.each do |r|
        r[:active]=true
        self.create(r)
      end
    end
    if service == 'craigslist'
      results = scraper.craigslist('jjj', /remote|Remote/)
      results.each do |r|
        self.create(r)
      end
    end
  end

  def notify_the_world!
    if self.active && !self.tweeted
      bitly_obj = Bitly.client.shorten("https://remotedigitaljobs.com/job/" + self.slug)
      @twitter = TwitterBandit.new()
      tweet = "Hiring remote #{self.job_title} @ #{bitly_obj.jmp_url} - #remotejobs #remotework #jobs #digitalmarketing"
      @twitter.tweet(tweet.length > 140 ? tweet[0,147]+"..." : tweet)
      self.update({tweeted:true, bitly: bitly_obj.jmp_url})
    end
  end

end
