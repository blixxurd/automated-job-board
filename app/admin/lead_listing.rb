# app/admin/products.rb
ActiveAdmin.register Lead do
  config.batch_actions = true

  # Create sections on the index screen
  permit_params :email
  scope :all, default: true

  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    column :email
    actions
  end

end
