require 'rails_helper'

describe 'Plan - ', type: :request do
  context 'Listing' do
    it 'request only one product_plans' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      plan = create(:product_plan, product: product)

      get api_product_plans_path
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['id']).to eq(plan.id)
      expect(data[0]['duration']).to eq(plan.duration)
      expect(data[0]['product_id']).to eq(plan.product_id)
    end
    it 'response 200 and a message to empty product plans' do
      get api_product_plans_path
      data = JSON.parse(response.body)

      expect(data['message']).to eq 'Nenhum plano encontrado'
      expect(response.status).to eq 200
    end
    it 'show two product plans' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      product2 = create(:product, name: 'Hospedagem',
                                  product_category: category)
      plan = create(:product_plan, product: product)
      plan2 = create(:product_plan, product: product2)

      get api_product_plans_path
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['id']).to eq(plan.id)
      expect(data[0]['duration']).to eq(plan.duration)
      expect(data[0]['product_id']).to eq(plan.product_id)
      expect(data[1]['id']).to eq(plan2.id)
      expect(data[1]['duration']).to eq(plan2.duration)
      expect(data[1]['product_id']).to eq(plan2.product_id)
    end
  end
end
