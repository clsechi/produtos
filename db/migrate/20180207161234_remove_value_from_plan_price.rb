class RemoveValueFromPlanPrice < ActiveRecord::Migration[5.1]
  def change
    remove_column :plan_prices, :value, :string
  end
end
