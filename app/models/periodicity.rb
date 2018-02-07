class Periodicity < ApplicationRecord
  has_many :plan_prices, dependent: :destroy
  validates :name, :period, presence: true
end
