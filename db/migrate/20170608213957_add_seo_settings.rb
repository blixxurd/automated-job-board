class AddSeoSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :seo_settings do |t|
      t.string  :route
      t.string  :meta_title
      t.text    :meta_desc
      t.text    :meta_additional
      t.timestamps
    end
  end
end
