require 'rails_helper'

feature 'User register all data' do
  scenario 'sucessfuly' do
    user = create(:user)
    periodicity = create(:periodicity)

    login_as(user)
    visit root_path
    click_on('Categoria')
    click_on('Cadastrar categoria')

    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição', with: 'Hospedagem ilimitada'
    click_on 'Enviar'

    click_on 'Cadastrar Produto'
    fill_in 'Nome', with: 'Hospedagem'
    fill_in 'Descrição Completa', with: 'Hospedagem ilimitada'
    fill_in 'Chave do Produto', with: 'HOSP123'
    fill_in 'Contrato', with: 'contrato123'
    attach_file('Icone', 'spec/support/fixtures/img.png')
    click_on 'Enviar'

    click_on 'Cadastrar plano'
    fill_in 'Nome', with: 'Hospedagem Ilimitada I'
    click_on 'Enviar'

    click_on 'Cadastrar preço'

    fill_in 'Valor', with: 25.50
    select periodicity.name, from: 'Periodicidade'
    click_on 'Enviar'

    expect(page).to have_content('R$ 25,50')
    expect(page).to have_content(periodicity.name)
  end
end
