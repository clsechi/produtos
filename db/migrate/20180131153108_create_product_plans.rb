class CreateProductPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :product_plans do |t|
      t.string :product
      t.integer :duration

      t.timestamps
    end
  end
end
