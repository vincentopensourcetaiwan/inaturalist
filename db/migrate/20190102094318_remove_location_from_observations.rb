class RemoveLocationFromObservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :observations, :location, :string
  end
end
