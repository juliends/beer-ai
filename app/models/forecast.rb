class Forecast < ApplicationRecord
  belongs_to :product
  belongs_to :delivery
end
