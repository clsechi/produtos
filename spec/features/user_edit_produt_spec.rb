require 'rails_helper'

feature 'User edit product' do
  scenario 'successfully' do
    category = create(:product_category)
    product = create(:product, name: 'Hospegem',
                               description: 'Hospedagem ilimitada',
                               product_category: category)
    user = create(:user)
    login_as(user)

    visit product_path product
    click_on 'Editar'
    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição Completa', with: 'Hospedagem limitada'
    select 'Ativo', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('Hospedagem')
    expect(page).to have_content('Hospedagem limitada')
    expect(page).to have_content(category.name)
    expect(page).to have_content('HOSP123')
    expect(page).to have_content('contrato123')
    expect(page).to have_content('Ativo')
  end

  scenario 'and must fill all fields' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, name: 'Hospegem',
                               description: 'Hospedagem ilimitada',
                               product_category: category)
    login_as(user)

    visit product_path product
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Descrição Completa', with: ''
    fill_in 'Chave do Produto', with: ''
    fill_in 'Contrato', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Contrato não pode ficar em branco')
    expect(page).to have_content('Chave do produto não pode ficar em branco')
  end

  scenario 'with status inactive' do
    category = create(:product_category)
    product = create(:product, name: 'Hospegem',
                               description: 'Hospedagem ilimitada',
                               product_category: category)
    user = create(:user)
    login_as(user)

    visit product_path product
    click_on 'Editar'
    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição Completa', with: 'Hospedagem limitada'
    select 'Inativo', from: 'Status'
    click_on 'Enviar'

    expect(page).to have_content('Hospedagem')
    expect(page).to have_content('Hospedagem limitada')
    expect(page).to have_content(category.name)
    expect(page).to have_content('HOSP123')
    expect(page).to have_content('contrato123')
    expect(page).to have_content('Inativo')
  end
end
