require 'rails_helper'

feature 'User can see plan prices' do
  scenario 'sucessfuly' do
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)
    periodicity = create(:periodicity)
    price = create(:plan_price, product_plan: plan, value: 110,
                                periodicity: periodicity)
    create(:plan_price, product_plan: plan, value: 150,
                        periodicity: periodicity)
    user = create(:user)
    login_as(user)

    visit plan_price_path(price)

    expect(page).to have_content(price.product_plan.name)
    expect(page).to have_content('R$ 110,00')
    expect(page).to have_content(price.periodicity.name)

    expect(page).not_to have_content('R$ 150,00')
  end
  scenario 'and see nothing if plan prices to be blank' do
    user = create(:user)
    login_as(user)

    visit plan_price_path(1)

    expect(page).to have_content('Não existe nenhum plano')
  end
end
