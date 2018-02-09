require 'rails_helper'

feature 'User edit category' do
  scenario 'sucessfuly' do
    user = create(:user)
    category = create(:product_category, name: 'Hospedagem',
                                         description: 'Hospedagem ilimitada')

    login_as(user)
    visit product_category_path category.id
    click_on 'Editar'

    fill_in 'Nome', with: 'Email'
    fill_in 'Descrição', with: '50 caixas de email'
    click_on 'Enviar'

    expect(page).to have_content('Email')
    expect(page).to have_content('50 caixas de email')
  end

  scenario 'cant save with blank field' do
    user = create(:user)
    category = create(:product_category, name: 'Hospedagem',
                                         description: 'Hospedagem ilimitada')
    login_as(user)

    visit product_category_path category.id
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end
end
