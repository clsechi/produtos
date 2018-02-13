require 'rails_helper'

feature 'User register plan' do
  scenario 'successfully' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)

    login_as(user)
    visit product_path(product)
    click_on 'Cadastrar plano'
    fill_in 'Nome', with: 'Hospedagem Ilimitada I'
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
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end
  scenario 'see comeback link in show' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)

    login_as(user)
    visit product_plan_path plan
    click_on('Voltar')

    expect(current_path).to eq product_path(product)
  end
end
