require 'rails_helper'

feature 'User register periodicity' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)

    visit root_path
    click_on 'Periodicidades'
    click_on 'Cadastrar periodicidade'
    fill_in 'Nome', with: 'Anual'
    fill_in 'Período', with: '12'
    click_on 'Enviar'

    expect(page).to have_content('Anual')
    expect(page).to have_content('12')
  end

  scenario 'and must fill in all fields' do
    user = create(:user)
    login_as(user)
    visit new_periodicity_path

    fill_in 'Nome', with: ''
    fill_in 'Período', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Período não pode ficar em branco')
  end
end
