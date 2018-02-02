require 'rails_helper'

describe 'Prices API', type: :request do
  context 'Sending' do
    it 'request a price' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      periodicity = Periodicity.create(name: 'Mensal', period: 1)
      plan = create(:product_plan, product: product)
      price = PlanPrice.create(product_plan: plan, value: 100,
                               periodicity: periodicity)

      get price_api_product_plan_path(plan)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['product_plan_id']).to eq(plan.id)
      expect(data['value']).to eq(price.value)
    end
  end
end
