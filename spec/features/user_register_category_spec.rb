require 'rails_helper'

feature 'User register category' do
  scenario 'sucessfuly' do
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
    visit root_path
    click_on('Categoria')
    click_on('Cadastrar categoria')

    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end
end
