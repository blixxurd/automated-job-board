class AddSourceIdToJobListings < ActiveRecord::Migration[5.0]
  def change
    add_column :job_listings, :source_id, :string
  end
end
