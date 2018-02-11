class PlanPrice < ApplicationRecord
  belongs_to :product_plan
  belongs_to :periodicity
  validates :value, presence: true,
                    format: { with: /[\d{1,3}(\.\d{3})*,\d{2}]/ }
end
