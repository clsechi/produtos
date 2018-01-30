require 'rails_helper'

feature 'User can see peridocity' do
  scenario 'sucessfuly' do

    periodicity = Periodicity.create(name: 'Mensal' , period: 3)

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
end
