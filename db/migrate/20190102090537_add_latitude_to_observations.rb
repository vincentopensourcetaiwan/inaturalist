class AddLatitudeToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :latitude, :float
  end
end
