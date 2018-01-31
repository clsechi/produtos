class RemoveProductFromProductPlans < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_plans, :product, :string
  end
end
