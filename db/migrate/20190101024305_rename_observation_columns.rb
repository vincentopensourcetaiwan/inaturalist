class RenameObservationColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :observations, :observation_id, :inaturalist_id
    rename_column :observations, :observation_uri, :uri
    rename_column :observations, :observation_photo_url, :photo_url
  end
end
