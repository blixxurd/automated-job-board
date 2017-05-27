# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
require "./"+ File.dirname(__FILE__) + "/environment.rb"
set :output, File.join(Whenever.path, "log", "cron.log")

every 2.hours do
  JobListing.generate_from("workingnomads")
end



# Learn more: http://github.com/javan/whenever
