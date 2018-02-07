require 'rails_helper'

describe 'Products - ', type: :request do
  context 'Listing' do
    it 'request only one product' do
      category = create(:product_category)
      product = create(:product, product_category: category)

      get api_category_products_path(category)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['products'][0]['id']).to eq(product.id)
      expect(data['products'][0]['name']).to eq(product.name)
      expect(data['products'][0]['description']).to eq(product.description)
      expect(data['products'][0]['product_key']).to eq(product.product_key)
      expect(data['products'][0]['product_category_id']).to eq(category.id)
    end
    it 'response 200 and empty hash to empty product' do
      category = create(:product_category)
      get api_category_products_path(category)
      data = JSON.parse(response.body)

      expect(data['products']).to eq []
    end
    it 'show two products' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      product2 = create(:product, name: 'Hospedagem',
                                  product_category: category)

      get api_category_products_path(category)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['products'][0]['id']).to eq(product.id)
      expect(data['products'][0]['name']).to eq(product.name)

      expect(data['products'][1]['id']).to eq(product2.id)
      expect(data['products'][1]['name']).to eq(product2.name)
    end
  end
end
