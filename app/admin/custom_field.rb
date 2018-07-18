# app/admin/products.rb
ActiveAdmin.register CustomField do
  config.batch_actions = true

  # Create sections on the index screen
  permit_params [:id, :name, :data]
  scope :all, default: true

  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    column :name
    actions
  end

end
