class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :ip
      t.string :port
      t.boolean :running

      t.timestamps
    end
  end
end
