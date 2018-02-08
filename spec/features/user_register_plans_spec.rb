require 'rails_helper'

feature 'User register plan' do
  scenario 'successfully' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)

    login_as(user)
    visit new_product_product_plan_path(product)
    fill_in 'Nome', with: 'Hospedagem Ilimitada I'
    select product.name, from: 'Produto'
    click_on 'Enviar'

    expect(page).to have_content(product.name)
  end

  scenario 'and must fill all fields' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)

    login_as(user)
    visit new_product_product_plan_path(product)
    fill_in 'Nome', with: ''
    select '', from: 'Produto'
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end
  scenario 'see come back link in show' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)

    login_as(user)
    visit product_plan_path plan
    click_on('Voltar')

    expect(current_path).to eq product_plans_path
  end
end
