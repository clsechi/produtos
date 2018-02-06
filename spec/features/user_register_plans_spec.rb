require 'rails_helper'

feature 'User register plan' do
  scenario 'successfully' do
    category = create(:product_category)
    product = Product.create(product_category: category)

    visit new_product_plan_path
    fill_in 'Duração', with: 30
    select product.name, from: 'Produto'
    click_on 'Enviar'

    expect(page).to have_content('30')
    expect(page).to have_content(product.name)
  end

  scenario 'and must fill all fields' do
    category = create(:product_category)
    Product.create(product_category: category)

    visit new_product_plan_path
    fill_in 'Duração', with: ''
    select '', from: 'Produto'
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end
  scenario 'see come back link in show' do
    category = create(:product_category)
    product = Product.create(product_category: category)
    plan = create(:product_plan, product: product)

    visit product_plan_path plan
    click_on('Voltar')

    expect(current_path).to eq product_plans_path
  end
end
