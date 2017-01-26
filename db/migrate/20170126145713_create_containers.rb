class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.string :name
      t.string :container_id
      t.string :image
      t.string :command
      t.string :status
      t.string :exposed_port
      t.string :host_port

      t.timestamps
    end
  end
end
