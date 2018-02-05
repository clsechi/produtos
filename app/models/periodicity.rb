class Periodicity < ApplicationRecord
  has_many :plan_prices, dependent: :destroy
end
