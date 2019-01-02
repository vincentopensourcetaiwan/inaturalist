class AddLongitudeToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :longitude, :float
  end
end
