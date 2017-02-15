class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.string :containerid
      t.string :name
      t.string :image
      t.string :command
      t.integer :exposedport
      t.integer :hostport
      t.string :status

      t.timestamps
    end
  end
end
