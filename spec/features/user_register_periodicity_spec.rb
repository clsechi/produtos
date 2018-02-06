require 'rails_helper'

feature 'User register periodicity' do
  scenario 'successfully' do
    visit new_periodicity_path
    fill_in 'Nome', with: 'Anual'
    fill_in 'Período', with: '12'
    click_on 'Enviar'

    expect(page).to have_content('Anual')
    expect(page).to have_content('12')
  end

  scenario 'and must fill in all fields' do
    visit new_periodicity_path
    fill_in 'Nome', with: ''
    fill_in 'Período', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Campos inválidos. Não pode ser nulo!')
  end
  scenario 'see come back link in show' do
    periodicity = create(:periodicity)

    visit periodicity_path periodicity
    click_on('Voltar')

    expect(current_path).to eq periodicities_path
  end
end
