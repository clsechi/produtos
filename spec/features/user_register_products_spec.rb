require 'rails_helper'

feature 'User register product' do
  scenario 'successfully' do
    user = create(:user)
    category = create(:product_category)

    login_as(user)
    visit new_product_path
    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição Completa', with: 'Hospedagem ilimitada'
    select category.name, from: 'Categoria'
    fill_in 'Chave do Produto', with: 'HOSP123'
    fill_in 'Contrato', with: 'contrato123'
    attach_file('Icone', 'spec/support/fixtures/hospedagem.png')
    click_on 'Enviar'

    expect(page).to have_css("img[src*='hospedagem.png']")
    expect(page).to have_content('Hospedagem')
    expect(page).to have_content('Hospedagem ilimitada')
    expect(page).to have_content(category.name)
    expect(page).to have_content('HOSP123')
    expect(page).to have_content('contrato123')
  end

  scenario 'and must fill all fields' do
    user = create(:user)
    create(:product_category)

    login_as(user)
    visit new_product_path
    fill_in 'Nome', with: ''
    fill_in 'Descrição Completa', with: ''
    select '', from: 'Categoria'
    fill_in 'Chave do Produto', with: ''
    fill_in 'Contrato', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end
  scenario 'see come back link in show' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)

    login_as(user)
    visit product_path product
    click_on('Voltar')

    expect(current_path).to eq products_path
  end
end
