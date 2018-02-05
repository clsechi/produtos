class ProductPlan < ApplicationRecord
  has_many :plan_prices, dependent: :destroy
  belongs_to :product
end
