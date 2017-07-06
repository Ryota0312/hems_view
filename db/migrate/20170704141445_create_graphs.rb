class CreateGraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :graphs do |t|
      t.string :hems_id
      t.string :postal
      t.boolean :main
      t.boolean :solar_generate
      t.boolean :solar_sold
      t.boolean :battery_charge
      t.boolean :battery_discharge
      t.boolean :fuel_cell
      t.boolean :gus
      t.boolean :water
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
