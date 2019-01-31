class AddNameToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :name, :string
  end
end
