class ProductPlan < ApplicationRecord
  has_many :plan_prices, dependent: :destroy
  belongs_to :product

  validates :product_id, :name, presence: true

  def actual_status
    return 'Inativo' if status == false
    'Ativo'
  end
end
