class ProductPlan < ApplicationRecord
  has_many :plan_prices
  belongs_to :product
end
