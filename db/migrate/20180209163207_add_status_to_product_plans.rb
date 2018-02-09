class AddStatusToProductPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :product_plans, :status, :boolean, default: true
  end
end
