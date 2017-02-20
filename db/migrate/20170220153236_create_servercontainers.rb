class CreateServercontainers < ActiveRecord::Migration[5.0]
  def change
    create_table :servercontainers do |t|
      t.integer :server_id
      t.integer :container_id

      t.timestamps
    end
  end
end
