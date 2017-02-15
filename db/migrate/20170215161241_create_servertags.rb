class CreateServertags < ActiveRecord::Migration[5.0]
  def change
    create_table :servertags do |t|
      t.belongs_to :server, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
