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
    it 'show only one product' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      another_product = create(:product, product_category: category)

      get api_product_path(product)

      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['products']['id']).to eq(product.id)
      expect(data['products']['name']).to eq(product.name)
      expect(data['products']['product_key']).to eq(product.product_key)
      expect(data['products']['contract']).to eq(product.contract)
      expect(
        data['products']['product_category_id']
      ).to eq(product.product_category_id)
      expect(data['products']['id']).not_to eq(another_product.id)
    end
    it 'and see a message if no product_id found' do
      get api_product_path(1)

      data = JSON.parse(response.body)
      expect(data['message']).to eq 'Nenhum produto encontrado'
      expect(response.status).to eq 404
    end
  end
end
