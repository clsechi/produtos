class Periodicity < ApplicationRecord
  has_many :plan_prices, dependent: :destroy
  validates :name, :period, presence: true
  validates :name, :period, uniqueness: true
  validates :period, numericality: { only_integer: true }
  validates :period, numericality: { greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 12 }
end
