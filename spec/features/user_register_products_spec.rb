require 'rails_helper'

feature 'User register product' do
  scenario 'successfully' do
    user = create(:user)
    category = create(:product_category)

    login_as(user)
    visit root_path
    click_on 'Categorias'
    click_on category.name
    click_on 'Cadastrar Produto'
    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição Completa', with: 'Hospedagem ilimitada'
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
    category = create(:product_category)

    login_as(user)
    visit new_product_category_product_path(category)
    fill_in 'Nome', with: ''
    fill_in 'Descrição Completa', with: ''
    fill_in 'Chave do Produto', with: ''
    fill_in 'Contrato', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end

  scenario 'see comeback link in show' do
    user = create(:user)
    category = create(:product_category)
    product = create(:product, product_category: category)

    login_as(user)
    visit product_path product
    click_on('Voltar')

    expect(current_path).to eq products_path
  end

  scenario 'and category id not exist' do
    user = create(:user)
    login_as(user)
    not_found_category = 50
    visit new_product_category_product_path(not_found_category)

    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição Completa', with: 'Hospedagem ilimitada'
    fill_in 'Chave do Produto', with: 'HOSP123'
    fill_in 'Contrato', with: 'contrato123'
    click_on 'Enviar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Categoria não existe')
  end
end
