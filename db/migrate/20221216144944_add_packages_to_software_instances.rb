class AddPackagesToSoftwareInstances < ActiveRecord::Migration[7.0]
  def change
    add_column :software_instances, :packages, :string
  end
end
