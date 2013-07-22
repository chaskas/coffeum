class CreateStations < ActiveRecord::Migration
  def change
  	drop_table :stations
    create_table :stations do |t|
      t.string :name
      t.string :code
      t.boolean :status

      t.timestamps
    end
  end
end
