require 'rails_helper'

describe 'Prices API', type: :request do
  context 'Sending' do
    it 'request a price' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      plan = create(:product_plan, product: product)
      periodicity = create(:periodicity)
      price = create(:plan_price, product_plan: plan, value: 100,
                                  periodicity: periodicity)
      actual_price = create(:plan_price, product_plan: plan, value: 80,
                                         periodicity: periodicity)

      get api_product_plan_plan_prices_path(plan)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data['plans']).to eq(plan.id)
      expect(data['prices'][0]['id']).to eq(actual_price.id)
      expect(data['prices'][0]['product_plan_id']).to eq(plan.id)
      expect(data['prices'][0]['value']).to eq(actual_price.value.to_s)
      expect(data['prices'][0]['periodicity']['name']).to eq(periodicity.name)
      expect(
        data['prices'][0]['periodicity']['period']
      ).to eq periodicity.period
      expect(data['prices'][0]['id']).not_to eq(price.id)
    end

    it 'request two prices and two periodicities for same plan' do
      category = create(:product_category)
      product = create(:product, product_category: category)
      plan = create(:product_plan, product: product)
      periodicity = create(:periodicity, name: 'Mensal', period: 1)
      price = create(:plan_price, product_plan: plan, value: 100,
                                  periodicity: periodicity)
      another_periodicity = create(:periodicity, name: 'Semestral', period: 6)
      another_price = create(:plan_price, product_plan: plan, value: 50,
                                          periodicity: another_periodicity)

      get price_api_product_plan_path(plan)
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['product_plan_id']).to eq(plan.id)
      expect(data[0]['periodicity_id']).to eq(periodicity.id)
      expect(data[0]['value']).to eq(price.value.to_s)
      expect(data[1]['periodicity_id']).to eq(another_periodicity.id)
      expect(data[1]['value']).to eq(another_price.value.to_s)
    end

    it 'response 404 to empty plan price' do
      params = { id: 3 }
      get price_api_product_plan_path(params)

      expect(response.status).to eq 404
    end
  end
end
