class AddContractFieldToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :contract, :text
  end
end
