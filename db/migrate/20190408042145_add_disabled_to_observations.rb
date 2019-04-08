class AddDisabledToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :disabled, :boolean, null: false, default: false
  end
end
