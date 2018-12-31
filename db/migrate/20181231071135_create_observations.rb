class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.integer :observation_id
      t.string :observation_uri
      t.string :observation_photo_url
      t.string :taxon_name
      t.text :description
      t.string :user_name
      t.string :user_login
      t.string :user_icon

      t.timestamps
    end
  end
end
