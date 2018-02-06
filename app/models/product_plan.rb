class ProductPlan < ApplicationRecord
  has_many :plan_prices, dependent: :destroy
  belongs_to :product

  validates :duration, :product_id, presence: true
end
