class PlanPrice < ApplicationRecord
  belongs_to :product_plan
  belongs_to :periodicity
  validates :value, presence: true
end
