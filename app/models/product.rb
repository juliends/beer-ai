class Product < ApplicationRecord
  has_many :deliveries
  has_many :forecasts, through: :deliveries
end
