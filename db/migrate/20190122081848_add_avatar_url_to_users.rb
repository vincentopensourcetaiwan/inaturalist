class AddAvatarUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :inaturalist_icon_url, :string
  end
end
