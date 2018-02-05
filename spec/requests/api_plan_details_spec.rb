require 'rails_helper'

describe 'Details Plan - ', type: :request do
  context 'Listing' do
    it 'request only one plan by id' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      plan = create(:product_plan, product: product)

      get api_product_plan_path(plan)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['id']).to eq(plan.id)
      expect(data[0]['duration']).to eq(plan.duration)
      expect(data[0]['product_id']).to eq(plan.product_id)
    end
    it 'response 404 to empty product plans' do
      get api_product_plan_path(100)

      data = JSON.parse(response.body)

      expect(response.status).to eq 404
      expect(data['message']).to eq 'Nenhum plano encontrado'
    end
    it 'response 404 to empty product plans' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      create(:product_plan, product: product)

      get api_product_plan_path(5)
      data = JSON.parse(response.body)

      expect(response.status).to eq 404
      expect(data['message']).to eq 'Nenhum plano encontrado'
    end
  end
end
