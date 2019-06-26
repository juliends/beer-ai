class Forecast < ApplicationRecord
  belongs_to :batch_product
  belongs_to :delivery
end
