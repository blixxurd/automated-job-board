# app/admin/products.rb
ActiveAdmin.register JobListing do
  config.batch_actions = true
  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |listing|
      listing.activate!
    end
    redirect_to collection_path, alert: "Activated!"
  end

  # Create sections on the index screen
  permit_params :job_title, :job_description, :location, :company, :how_to_apply, :active, :promoted, :slug
  scope :all, default: true

  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    column :job_title
    column :company
    column :active
    actions
  end

end
