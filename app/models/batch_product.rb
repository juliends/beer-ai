# t.bigint "batch_id"
# t.bigint "product_id"
# t.integer "threshold"
# t.text "note"

class BatchProduct < ApplicationRecord
  belongs_to :batch
  belongs_to :product
  has_many :deliveries, dependent: :destroy

  delegate :name, to: :product, prefix: false
end
