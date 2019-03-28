class AddSearchNmaeToPeriods < ActiveRecord::Migration[5.2]
  def change
    add_column :periods, :search_name, :string
  end
end
