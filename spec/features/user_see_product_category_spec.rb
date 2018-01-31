require 'rails_helper'

feature 'product_category' do
  scenario 'success' do
    product_category = ProductCategory.create(name: 'Hospedagem',
                                              description: 'Domínio grátis e
                                              sites ilimitados')

    visit root_path
    click_on('Categoria')

    expect(page).to have_content(product_category.name)
    expect(page).to have_content(product_category.description)
    expect(page).not_to have_content('Não há categorias cadastradas!')
  end

  scenario 'show error message when dont have category' do
    visit root_path
    click_on('Categoria')

    expect(page).to have_content('Não há categorias cadastradas!')
  end

  scenario 'show two categories' do
    product_category = ProductCategory.create(name: 'Hospedagem',
                                              description: 'Domínio grátis e
                                             sites ilimitados')
    other_product_category = ProductCategory.create(name: 'Email',
                                                    description: 'Contas
                                                    ilimitadas')

    visit root_path
    click_on('Categoria')

    expect(page).to have_content(product_category.name)
    expect(page).to have_content(product_category.description)
    expect(page).to have_content(other_product_category.name)
    expect(page).to have_content(other_product_category.description)
  end
end
