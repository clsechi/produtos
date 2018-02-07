class AddValueFromPlanPrice < ActiveRecord::Migration[5.1]
  def change
    add_column :plan_prices, :value, :decimal
  end
end
