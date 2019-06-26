class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :city
      t.integer :number
      t.date :start_date
      t.date :end_date
      t.integer :headcount
      t.text :note

      t.timestamps
    end
  end
end
