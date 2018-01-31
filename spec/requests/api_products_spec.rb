require 'rails_helper'

describe 'Products - ', type: :request do
  context 'Listing' do
    it 'request only one product' do
      category = create(:product_category)
      product = create(:product, product_category: category)

      get api_products_path
      data = parse_json

      expect(response.status).to eq 200
      expect(data[:id]).to eq(product.id)
      expect(data[:name]).to eq(product.name)
      expect(data[:description]).to eq(product.description)
      expect(data[:product_key]).to eq(product.product_key)
      expect(data[:product_category]).to eq(product.product_category)
    end
  end
end
