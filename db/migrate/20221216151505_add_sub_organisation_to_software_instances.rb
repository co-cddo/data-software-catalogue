class AddSubOrganisationToSoftwareInstances < ActiveRecord::Migration[7.0]
  def change
    add_column :software_instances, :sub_organisation, :string
  end
end
