class CreatePeriodings < ActiveRecord::Migration[5.2]
  def change
    create_table :periodings do |t|
      t.belongs_to :period, foreign_key: true
      t.belongs_to :observation, foreign_key: true

      t.timestamps
    end
  end
end
