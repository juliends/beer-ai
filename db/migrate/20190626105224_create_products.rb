class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :batch, foreign_key: true
      t.string :name
      t.text :description
      t.string :emoji
      t.integer :threshold

      t.timestamps
    end
  end
end
