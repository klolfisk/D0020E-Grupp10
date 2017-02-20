class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.integer :container_id
      t.string :name
      t.string :image
      t.integer :port
      t.string :status
      t.string :command

      t.timestamps
    end
  end
end
