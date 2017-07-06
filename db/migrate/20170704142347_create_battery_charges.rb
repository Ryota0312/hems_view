class CreateBatteryCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :battery_charges do |t|
      t.float :value
      t.datetime :timestamp
      t.belongs_to :house, foreign_key: true

      t.timestamps
    end
  end
end
