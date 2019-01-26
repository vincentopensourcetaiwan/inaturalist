class AddCategoryNameToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :category_name, :string
  end
end
