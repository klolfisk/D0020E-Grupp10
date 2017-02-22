class RenamecolumnContainerIdToDockercontainerId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :containers, :container_id, :dockercontainer_id
  end
end
