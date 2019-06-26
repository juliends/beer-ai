class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.date :date
      t.integer :qty
      t.text :note
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
