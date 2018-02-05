require 'rails_helper'
describe 'Category API', type: :request do
  it 'see a category register' do
    category = create(:product_category)

    get api_categories_path
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data[0]['name']).to eq category.name
    expect(data[0]['description']).to eq category.description
  end

  it 'and see a message if no categories found' do
    get api_categories_path

    data = JSON.parse(response.body)

    expect(data['message']).to eq 'Nenhuma categoria encontrada'
    expect(response.status).to eq 200
  end

  it 'and see a list of categories ' do
    category = create_list(:product_category, 3)

    get api_categories_path
    data = JSON.parse(response.body)
    expect(response.status).to eq 200

    expect(data[0]['name']).to eq category[0].name
    expect(data[0]['description']).to eq category[0].description
    expect(data[1]['name']).to eq category[1].name
    expect(data[1]['description']).to eq category[1].description
    expect(data[2]['name']).to eq category[2].name
    expect(data[2]['description']).to eq category[2].description
  end
end
