require 'rails_helper'

feature 'User can see peridocity ' do
  scenario 'sucessfuly' do

    periodicity = Periodicity.create(name: 'Mensal' , period: 3)

    visit root_path
    click_on('Periodicidade')

    expect(page).to have_content(periodicity.name)
    expect(page).to have_content(periodicity.period)
  end
end
