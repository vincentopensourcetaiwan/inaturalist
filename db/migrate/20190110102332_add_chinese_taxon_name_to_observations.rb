class AddChineseTaxonNameToObservations < ActiveRecord::Migration[5.2]
  def change
    add_column :observations, :chinese_taxon_name, :string
  end
end
