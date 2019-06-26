# t.bigint "batch_id"
# t.bigint "product_id"
# t.integer "threshold"
# t.text "note"

class BatchProduct < ApplicationRecord
  belongs_to :batch
  belongs_to :product
  has_many :deliveries

  # aliases self.product.name as self.name
  delegate :name, to: :product, prefix: false

  # aliases self.deliveries.count as self.deliveries_count
  delegate :count, to: :deliveries, prefix: true
end
