class AddProductPlanRefToPlanPrices < ActiveRecord::Migration[5.1]
  def change
    add_reference :plan_prices, :product_plan, foreign_key: true
  end
end
