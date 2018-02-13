require 'rails_helper'

feature 'User register category' do
  scenario 'sucessfuly' do
    user = create(:user)
    login_as(user)

    visit root_path

    click_on('Categoria')
    click_on('Cadastrar categoria')

    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição', with: 'Hospedagem ilimitada'
    click_on 'Enviar'

    expect(page).to have_content('Hospedagem')
    expect(page).to have_content('Hospedagem ilimitada')
  end

  scenario 'cant save with blank field' do
    user = create(:user)
    login_as(user)

    visit root_path

    click_on('Categoria')
    click_on('Cadastrar categoria')

    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
  end
  scenario 'see comeback link in show' do
    category = create(:product_category)
    user = create(:user)
    login_as(user)

    visit product_category_path category
    click_on('Voltar')

    expect(current_path).to eq product_categories_path
  end
end
