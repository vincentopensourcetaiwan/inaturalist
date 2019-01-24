class AddInaturalistIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :inaturalist_id, :integer
  end
end
