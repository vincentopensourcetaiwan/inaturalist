class AddObservedAtToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :observed_at, :datetime
  end
end
