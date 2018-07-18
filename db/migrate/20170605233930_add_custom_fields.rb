class AddCustomFields < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.text   :data
      t.timestamps
    end
  end
end
