class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.references :product, foreign_key: true
      t.references :delivery, foreign_key: true
      t.float :rotation
      t.date :date
      t.integer :qty

      t.timestamps
    end
  end
end
