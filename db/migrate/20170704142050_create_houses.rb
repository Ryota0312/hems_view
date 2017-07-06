class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :hems_id
      t.string :postal

      t.timestamps
    end
  end
end
