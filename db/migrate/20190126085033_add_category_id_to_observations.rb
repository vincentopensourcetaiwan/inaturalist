class AddCategoryIdToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :category_id, :integer
  end
end
