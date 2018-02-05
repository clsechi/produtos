require 'rails_helper'

describe 'Products - ', type: :request do
  context 'Listing' do
    it 'request only one product' do
      category = create(:product_category)
      product = create(:product, product_category: category)

      get api_products_path
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['id']).to eq(product.id)
      expect(data[0]['name']).to eq(product.name)
      expect(data[0]['description']).to eq(product.description)
      expect(data[0]['product_key']).to eq(product.product_key)
      expect(data[0]['product_category_id']).to eq(product.product_category.id)
    end
    it 'response 200 and message to empty product' do
      get api_products_path
      data = JSON.parse(response.body)

      expect(data['message']).to eq 'Nenhum produto encontrado'
      expect(response.status).to eq 404
    end
    it 'show two products' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      product2 = create(:product, name: 'Hospedagem',
                                  product_category: category)

      get api_products_path
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['id']).to eq(product.id)
      expect(data[0]['name']).to eq(product.name)

      expect(data[1]['id']).to eq(product2.id)
      expect(data[1]['name']).to eq(product2.name)
    end
  end
end
