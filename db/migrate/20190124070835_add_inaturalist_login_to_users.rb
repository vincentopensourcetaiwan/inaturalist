class AddInaturalistLoginToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :inaturalist_login, :string
  end
end
