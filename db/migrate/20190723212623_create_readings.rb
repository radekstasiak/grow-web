class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.text :name
      t.integer :moisture_level_status
      t.text :soil_moisture_status
      t.integer :water_pump_status

      t.timestamps
    end
  end
end
