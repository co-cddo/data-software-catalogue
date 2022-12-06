class CreateSoftwareInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :software_instances do |t|
      t.string :name
      t.references :organisation, null: false, foreign_key: true
      t.string :organisation_group
      t.string :team
      t.string :owner
      t.string :product
      t.string :provider
      t.string :provider_contact
      t.string :version
      t.text :description
      t.string :status
      t.boolean :internal
      t.string :license
      t.integer :quantity_purchased
      t.integer :quantity_used

      t.timestamps
    end
  end
end
