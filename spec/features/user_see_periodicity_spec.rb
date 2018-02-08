require 'rails_helper'

feature 'User can see peridocity' do
  scenario 'sucessfuly' do
    periodicity = create(:periodicity, name: 'Mensal', period: 1)
    user = create(:user)
    login_as(user)

    visit root_path
    click_on('Periodicidades')

    expect(page).to have_content(periodicity.name)
    expect(page).to have_content(periodicity.period)
  end
  scenario 'and see nothing if periodicities table to be blank' do
    user = create(:user)
    login_as(user)
    visit periodicities_path
    expect(page).not_to have_content('Mensal')
    expect(page).to have_content('Não existe nenhuma periodicidade cadastrada')
  end

  scenario 'and see two periodicity' do
    first_periodicity = create(:periodicity, name: 'Mensal', period: 1)
    second_periodicity = create(:periodicity, name: 'Trimestral', period: 3)
    user = create(:user)
    login_as(user)

    visit periodicities_path

    expect(page).to have_content(first_periodicity.name)
    expect(page).to have_content(first_periodicity.period)
    expect(page).to have_content(second_periodicity.name)
    expect(page).to have_content(second_periodicity.period)
  end
end
