require 'rails_helper'

feature 'user can see plans' do
  scenario 'sucessfuly' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)
    periodicity = create(:periodicity, name: 'Mensal', period: 1)
    create(:plan_price, product_plan: plan, value: 10.53,
                        periodicity: periodicity)

    login_as(user)
    visit product_plans_path

    expect(page).to have_content(plan.name)
    expect(page).to have_content(plan.product.name)
    # expect(page).to have_content(plan.plan_price.value)
  end

  scenario 'and see nothing if plans table to be blank' do
    user = create(:user)
    login_as(user)
    visit product_plans_path

    expect(page).not_to have_content('Email')
    expect(page).to have_content('Não existe nenhum plano cadastrado')
  end

  scenario 'and see two plans' do
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)
    another_plan = create(:product_plan, product: product)
    periodicity = create(:periodicity, name: 'Mensal', period: 1)
    another_periodicity = create(:periodicity, name: 'Anual', period: 12)
    create(:plan_price, product_plan: plan, value: 10.0,
                        periodicity: periodicity)
    create(:plan_price, product_plan: another_plan, value: 5,
                        periodicity: another_periodicity)

    user = create(:user)
    login_as(user)
    visit product_plans_path

    expect(page).to have_content(plan.name)
    expect(page).to have_content(plan.product.name)
    # expect(page).to have_content(plan.plan_price.value)
    expect(page).to have_content(another_plan.name)
    expect(page).to have_content(another_plan.product.name)
    # expect(page).to have_content(another_plan.plan_price.value)
  end
end
