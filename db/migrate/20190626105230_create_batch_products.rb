class CreateBatchProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :batch_products do |t|
      t.references :batch, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :threshold
      t.text :note

      t.timestamps
    end
  end
end
