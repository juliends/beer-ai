class Forecast < ApplicationRecord
  belongs_to :batch_product
  belongs_to :delivery

  delegate :emoji, to: :batch_product, prefix: false
end
