require 'rails_helper'

feature 'user can see plans' do
  scenario 'sucessfuly' do
    plan = ProductPlan.create(product: 'email', duration: 3)

    visit product_plans_path

    expect(page).to have_content(plan.product)
    expect(page).to have_content(plan.duration)
  end
end
