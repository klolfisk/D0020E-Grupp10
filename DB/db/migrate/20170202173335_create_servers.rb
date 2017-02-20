class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.integer :port
      t.string :running
      t.string :ip

      t.timestamps
    end
  end
end
