require 'rails_helper'

feature 'products' do
  scenario 'success' do
    product = Product.create(name: 'Hospedagem', description: 'Hospedagem nova',
                             product_key: 'HOP123')

    visit root_path
    click_on 'Produtos'

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.product_key)
  end
end
