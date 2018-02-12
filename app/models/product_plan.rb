class ProductPlan < ApplicationRecord
  has_many :plan_prices, dependent: :destroy
  belongs_to :product

  validates :product_id, :name, presence: true

  def actual_status
    status ? 'Ativo' : 'Inativo'
  end

  def last_prices   
    prices = []
    Periodicity.all.each do |per|
      price = PlanPrice.where(['periodicity_id = ? and product_plan_id = ?', per.id, self.id]).last
      unless price.nil?
        prices << price
      end
    end
    prices
  end
end
