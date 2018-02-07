require 'rails_helper'

describe 'Plan - ', type: :request do
  context 'Listing' do
    it 'request only one product_plans' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      plan = create(:product_plan, product: product)

      get api_product_product_plans_path(product)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['plans'][0]['id']).to eq(plan.id)
      expect(data['plans'][0]['duration']).to eq(plan.duration)
      expect(data['plans'][0]['product_id']).to eq(plan.product_id)
    end
    it 'response 200 and a message to empty product plans' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      get api_product_product_plans_path(product)
      data = JSON.parse(response.body)

      expect(data['plans']).to eq []
      expect(response.status).to eq 200
    end
    it 'show two product plans' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      plan = create(:product_plan, product: product)
      another_plan = create(:product_plan, product: product)

      get api_product_product_plans_path(product)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['plans'][0]['id']).to eq(plan.id)
      expect(data['plans'][0]['duration']).to eq(plan.duration)
      expect(data['plans'][0]['product_id']).to eq(plan.product_id)

      expect(data['plans'][1]['id']).to eq(another_plan.id)
      expect(data['plans'][1]['duration']).to eq(another_plan.duration)
      expect(data['plans'][1]['product_id']).to eq(another_plan.product_id)
    end
    it 'get plans from a product' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      plan = create(:product_plan, product: product)
      another_plan = create(:product_plan, product: product)

      get api_product_product_plans_path(product)

      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['plans'][0]['product_id']).to eq(plan.product_id)
      expect(data['plans'][0]['duration']).to eq(plan.duration)
      expect(data['plans'][1]['product_id']).to eq(another_plan.product_id)
      expect(data['plans'][1]['duration']).to eq(another_plan.duration)
    end
  end
end
