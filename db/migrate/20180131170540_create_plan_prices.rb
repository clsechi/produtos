class CreatePlanPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_prices do |t|
      t.integer :value

      t.timestamps
    end
  end
end
