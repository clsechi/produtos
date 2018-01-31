class AddProductRefToProductPlans < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_plans, :product, foreign_key: true
  end
end
