class Product < ApplicationRecord
  belongs_to :batch
  has_many :deliveries
  has_many :forecasts, through: :deliveries
end
