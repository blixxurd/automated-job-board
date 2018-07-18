# app/admin/products.rb
ActiveAdmin.register SeoSetting do
  config.batch_actions = true

  # Create sections on the index screen
  permit_params [:id, :route, :meta_title, :meta_desc, :meta_additional]
  scope :all, default: true

  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    column :route
    actions
  end

end
