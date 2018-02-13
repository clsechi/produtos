require 'rails_helper'

feature 'User edit plan' do
  scenario 'successfully' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, name: 'Hospedagem Ilimitada I',
                                 product_id: product.id)

    login_as(user)
    visit product_plan_path(plan)
    click_on 'Editar'
    fill_in 'Nome', with: 'Hospedagem Ilimitada II'
    select 'Ativo', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('Hospedagem Ilimitada II')
    expect(page).to have_content('Ativo')
  end

  scenario 'and must fill all fields' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, name: 'Hospedagem Ilimitada I',
                                 product_id: product.id)

    login_as(user)
    visit product_plan_path(plan)
    click_on 'Editar'

    fill_in 'Nome', with: ''
    select 'Inativo', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end

  scenario 'with status inactive' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)
    plan = create(:product_plan, name: 'Hospedagem Ilimitada I',
                                 product_id: product.id)

    login_as(user)
    visit product_plan_path(plan)
    click_on 'Editar'
    fill_in 'Nome', with: 'Hospedagem Ilimitada II'
    select 'Inativo', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('Hospedagem Ilimitada II')
    expect(page).to have_content('Inativo')
  end
  scenario 'and see nothing if plan to be blank' do
    user = create(:user)
    login_as(user)

    visit new_product_product_plan_path(1)
    fill_in 'Nome', with: 'Hospedagem Ilimitada II'
    select 'Ativo', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('Produto não existe')
  end
end
