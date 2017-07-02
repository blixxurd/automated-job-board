# Automated Job Board

This is an automated job board that crawls results from popular remote job sites. Individual crawling methods are in the `lib` directory. A demo site can be found at https://remotedigitaljobs.com/

## Functionality Rundown
* Cron job runs the `task.rb` file in the root directory on a schedule of your choice. 
* New jobs are added to the apps database, and set to active. 
* New jobs are automatically Tweeted to associated Twitter account.
* Jobs can also be added/deleted/updated through the ActiveAdmin URL. 


## App Setup
* Clone Repository
* Run `bundle install`
* Make sure postgres is running, and 
  * Run `rake db:migrate` to setup Database
  * Run `rake db:seed` to insert default values for ActiveAdmin
* Setup Environment Variables (See environment vars section below)
* Run `bundle exec rails s` to start server. 
* Login to http://yourdomain.com/admin (Default user/pass - admin@example.com/password)
  * Change your password and email
* Create a cron job, and have it run `task.rb` on an interval of your choosing

## Environment Variables
* `DATABASE_URL` - The Postgres URL for your production DB. 
* `TWITTER_CONSUMER_KEY` - Twitter Consumer Key for Automated Tweets
* `TWITTER_CONSUMER_SECRET` - Twitter Consumer Secret for Automated Tweets
* `TWITTER_ACCESS_TOKEN` - Twitter Access Token for Automated Tweets
* `TWITTER_ACCESS_TOKEN_SECRET` - Twitter Access Token Secret for Automated Tweets


## Cron Setup
The automated tasks are stored in the `task.rb` file. Have your crontab run this file on an interval if you want automated job postings. 

## Other Info
* This project was made for learning purposes. If you believe the crawling you are doing on other sites is intrusive, or you were told not to crawl a certain website - make sure to respect the owners wishes and deactivate your crawler. 
* You can add more tasks to the cron job easily within the `task.rb` file

## Special File Info
The files below were created for this project, but also have functionality that can be used or extended on if needed. 

### lib/twitter_bandit.rb
In addition to tweeting out info, this file can be run as a standalone ruby script to do the following actions:
* Tweet to your account
* Mass follow users based on hashtag
* Gather a list of users discussing a certain topic
* Access the Twitter Client. 

### lib/web_scraper.rb
This file is made primarily for crawling different sites, for educational purposes. In addition to the 2 active crawls, it has shell methods in case anybody wants to extend it. It also has a robust craigslist crawler, which is not attached to the cron. 

