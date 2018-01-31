require 'rails_helper'

feature 'user can see plans' do
  scenario 'sucessfuly' do
    plan = ProductPlan.create(product: 'email', duration: 3)
    price = PlanPrice.create(product_plan: plan, value: 10)

    visit product_plans_path

    expect(page).to have_content(price.product_plan.product)
    expect(page).to have_content(plan.duration)
  end

  scenario 'and see nothing if plans table to be blank' do
    visit product_plans_path

    expect(page).not_to have_content('Email')
    expect(page).to have_content('Não existe nenhum plano cadastrado')
  end

  scenario 'and see two plans' do
    plan = ProductPlan.create(product: 'email', duration: 3)
    another_plan = ProductPlan.create(product: 'hospedagem', duration: 12)
    price = PlanPrice.create(product_plan: plan, value: 10)
    another_price = PlanPrice.create(product_plan: another_plan, value: 5)

    visit product_plans_path

    expect(page).to have_content(price.product_plan.product)
    expect(page).to have_content(plan.duration)
    expect(page).to have_content(another_price.product_plan.product)
    expect(page).to have_content(another_plan.duration)
  end
  scenario 'and see plan price' do
    plan = ProductPlan.create(product: 'email', duration: 3)
    price = PlanPrice.create(product_plan: plan, value: 10)

    visit product_plans_path

    expect(page).to have_content(price.product_plan.product)
    expect(page).to have_content(plan.duration)
    expect(page).to have_content(price.value)
  end
end
