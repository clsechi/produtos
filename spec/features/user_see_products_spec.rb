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
    expect(page).not_to have_content('Não há produtos cadastrados!')
  end
  scenario 'show error message when dont have product' do

    visit root_path
    click_on 'Produtos'

    expect(page).to have_content('Não há produtos cadastrados!')
  end
end
