class Delivery < ApplicationRecord
  belongs_to :batch_product
  has_many :forecasts, dependent: :destroy
end
