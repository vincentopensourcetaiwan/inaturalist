class CreatePlacings < ActiveRecord::Migration[5.2]
  def change
    create_table :placings do |t|
      t.belongs_to :place, foreign_key: true
      t.belongs_to :observation, foreign_key: true

      t.timestamps
    end
  end
end
