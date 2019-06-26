class Batch < ApplicationRecord
  has_many :batch_products
  has_many :products, through: :batch_products
  has_many :deliveries, through: :batch_products
end
