class AddWikipediaUrlToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :wikipedia_url, :string
  end
end
