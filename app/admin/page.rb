# app/admin/products.rb
ActiveAdmin.register Page do
  config.batch_actions = true

  # Create sections on the index screen
  permit_params [:id, :slug, :title, :body]
  scope :all, default: true

  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    column :title
    actions
  end

end
