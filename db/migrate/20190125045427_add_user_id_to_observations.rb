class AddUserIdToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :user_id, :integer
  end
end
