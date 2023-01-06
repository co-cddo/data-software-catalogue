class AddTagToOrganisations < ActiveRecord::Migration[7.0]
  def change
    add_column :organisations, :tag, :string
    add_index :organisations, :tag
  end
end
