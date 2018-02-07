class RemoveDurationFromProductPlan < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_plans, :duration, :string
  end
end
