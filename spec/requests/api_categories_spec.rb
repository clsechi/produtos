require 'rails_helper'
describe 'Category API', type: :request do
  it 'see a category register' do
    category = create(:product_category)

    get api_categories_path
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data['categories'][0]['name']).to eq category.name
    expect(data['categories'][0]['description']).to eq category.description
  end

  it 'and see a message if no categories found' do
    get api_categories_path

    data = JSON.parse(response.body)

    expect(data['categories']).to eq []
  end

  it 'and see a list of categories ' do
    category = create_list(:product_category, 3)

    get api_categories_path
    data = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(data['categories'][0]['name']).to eq category[0].name
    expect(data['categories'][0]['description']).to eq category[0].description
    expect(data['categories'][1]['name']).to eq category[1].name
    expect(data['categories'][1]['description']).to eq category[1].description
    expect(data['categories'][2]['name']).to eq category[2].name
    expect(data['categories'][2]['description']).to eq category[2].description
  end
  it 'see one category' do
    category = create(:product_category)
    category_two = create(:product_category, name: 'Email',
                                             description: 'Email 10')

    get api_category_path(category)

    data = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(data['categories']['name']).to eq category.name
    expect(data['categories']['description']).to eq category.description
    expect(data['categories']['name']).not_to eq category_two.name
    expect(data['categories']['description']).not_to eq category_two.description
  end
  it 'and see a message if no categories_id found' do
    get api_category_path(1)

    data = JSON.parse(response.body)
    expect(data['message']).to eq 'Nenhuma categoria encontrada'
    expect(response.status).to eq 404
  end
end
