class Batch < ApplicationRecord
  has_many :products
  has_many :deliveries, through: :products
end
