require 'rails_helper'

feature 'User register plan price' do
  scenario 'successfully' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)
    periodicity = create(:periodicity)

    login_as user
    visit product_plan_path(plan)
    click_on 'Cadastrar preço'

    fill_in 'Valor', with: 25.50
    select periodicity.name, from: 'Periodicidade'
    click_on 'Enviar'

    expect(page).to have_content('R$ 25,50')
    expect(page).to have_content(plan.name)
    expect(page).to have_content(periodicity.name)
  end

  scenario 'and must fill all fields' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    create(:product_plan, product: product)
    create(:periodicity)

    login_as user
    visit new_product_plan_plan_price_path product
    fill_in 'Valor', with: ''
    select '', from: 'Periodicidade'
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end

  scenario 'see come back link in show' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)
    periodicity = create(:periodicity)
    price = create(:plan_price, periodicity: periodicity, product_plan: plan)

    login_as user
    visit plan_price_path price
    click_on('Voltar')

    expect(current_path).to eq product_plan_path plan
  end
end
