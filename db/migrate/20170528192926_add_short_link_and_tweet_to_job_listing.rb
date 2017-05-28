class AddShortLinkAndTweetToJobListing < ActiveRecord::Migration[5.0]
  def change
    add_column :job_listings, :tweeted, :boolean
    add_column :job_listings, :bitly, :string
  end
end
