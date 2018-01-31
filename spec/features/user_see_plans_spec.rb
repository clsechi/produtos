require 'rails_helper'

feature 'user can see plans' do
  scenario 'sucessfuly' do
    plan = ProductPlan.create(product: 'email', duration: 3)

    visit product_plans_path

    expect(page).to have_content(plan.product)
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

    visit product_plans_path

    expect(page).to have_content(plan.product)
    expect(page).to have_content(plan.duration)
    expect(page).to have_content(another_plan.product)
    expect(page).to have_content(another_plan.duration)
  end
end
