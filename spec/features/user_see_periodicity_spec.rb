require 'rails_helper'

feature 'User can see peridocity' do
  scenario 'sucessfuly' do

    periodicity = Periodicity.create(name: 'Mensal' , period: 1)

    visit root_path
    click_on('Periodicidade')

    expect(page).to have_content(periodicity.name)
    expect(page).to have_content(periodicity.period)
  end
  scenario 'and see nothing if periodicities table to be blank' do
    visit periodicities_path
    expect(page).not_to have_content('Mensal')
    expect(page).to have_content('Não existe nenhuma periodicidade cadastrada')
  end

  scenario 'and see two periodicity' do

    first_periodicity = Periodicity.create(name: 'Mensal' , period: 1)
    second_periodicity = Periodicity.create(name: 'Trimestral' , period: 3)

    visit periodicities_path

    expect(page).to have_content(first_periodicity.name)
    expect(page).to have_content(first_periodicity.period)
    expect(page).to have_content(second_periodicity.name)
    expect(page).to have_content(second_periodicity.period)

  end

end
