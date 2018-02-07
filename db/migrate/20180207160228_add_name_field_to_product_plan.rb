class AddNameFieldToProductPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :product_plans, :name, :string
  end
end
