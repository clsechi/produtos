class AddPeriodicityRefToPlanPrices < ActiveRecord::Migration[5.1]
  def change
    add_reference :plan_prices, :periodicity, foreign_key: true
  end
end
