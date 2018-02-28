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
    expect(page).to have_content(another_plan.name)
    expect(page).to have_content(another_plan.product.name)
  end

  scenario 'and prices information' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, product: product)
    another_plan = create(:product_plan, product: product, name: 'Hotsite')
    periodicity = create(:periodicity, name: 'Mensal', period: 1)
    create(:plan_price, product_plan: plan, value: 10.53,
                        periodicity: periodicity)
    create(:plan_price, product_plan: another_plan, value: 90.75,
                        periodicity: periodicity)

    login_as(user)
    visit product_plans_path
    click_on(plan.name)

    expect(page).to have_content(plan.name)
    expect(page).to have_content(plan.product.name)
    expect(page).to have_content('Ativo')
    expect(page).to have_content('R$ 10,53')
    expect(page).not_to have_content('R$ 90,75')
  end
end
