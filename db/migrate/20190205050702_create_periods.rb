class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :start_year
      t.integer :start_month
      t.integer :start_day
      t.integer :end_year
      t.integer :end_month
      t.integer :end_day

      t.timestamps
    end
  end
end
