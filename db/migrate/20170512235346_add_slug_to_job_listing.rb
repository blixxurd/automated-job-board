class AddSlugToJobListing < ActiveRecord::Migration[5.0]
  def change
    add_column :job_listings, :slug, :string
  end
end
