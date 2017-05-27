class AddJobListings < ActiveRecord::Migration[5.0]
  def change
    create_table :job_listings do |t|
      t.string :job_title
      t.text   :job_description
      t.string :location
      t.string :company
      t.text :how_to_apply
      t.boolean :active
      t.boolean :promoted
      t.timestamps
    end
  end
end
