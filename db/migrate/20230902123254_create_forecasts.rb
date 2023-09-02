class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.string :address
      t.float :current_temperature
      t.float :high_temperature
      t.float :low_temperature
      t.text :extended_forecast
      t.datetime :cached_at

      t.timestamps
    end
  end
end
