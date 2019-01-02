class AddLocationToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :location, :string
  end
end
