class CreateServerhascontainers < ActiveRecord::Migration[5.0]
  def change
    create_table :serverhascontainers do |t|
      t.belongs_to :container, foreign_key: true
      t.belongs_to :server, foreign_key: true

      t.timestamps
    end
  end
end
