require 'rails_helper'
describe 'Category API', type: :request do
  context 'Listing' do
    it 'send a list of category' do
      category = FactoryBot.create(:product_category)

      get api_categories_path
      data = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(data[0]['name']).to eq category.name
      expect(data[0]['description']).to eq category.description
    end
  end
end
