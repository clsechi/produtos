require 'rails_helper'

feature 'user can see plans' do
  scenario 'sucessfuly' do
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = ProductPlan.create(product: product, duration: 3)

    visit product_plans_path

    expect(page).to have_content(plan.product.name)
    expect(page).to have_content(plan.product.product_category.name)
    expect(page).to have_content(plan.duration)
  end

  scenario 'and see nothing if plans table to be blank' do
    visit product_plans_path

    expect(page).not_to have_content('Email')
    expect(page).to have_content('Não existe nenhum plano cadastrado')
  end

  scenario 'and see two plans' do
    category = create(:product_category)
    product = create(:product, product_category: category)
    product1 = create(:product, name: 'Email', product_category: category)
    plan = ProductPlan.create(product: product, duration: 3)
    another_plan = ProductPlan.create(product: product1, duration: 12)

    visit product_plans_path

    expect(page).to have_content(plan.product.name)
    expect(page).to have_content(plan.product.product_category.name)
    expect(page).to have_content(plan.duration)
    expect(page).to have_content(another_plan.product.name)
    expect(page).to have_content(another_plan.product.product_category.name)
    expect(page).to have_content(another_plan.duration)
  end
end
