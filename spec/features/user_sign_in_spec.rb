require 'rails_helper'

feature 'user can sign in' do
  scenario 'sucessfuly' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    expect(page).to have_content('Sair')
    expect(current_path).to eq root_path
  end
  scenario 'and could be register' do
    user = build(:user)
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    fill_in 'Confirmar senha', with: user.password
    click_on 'Registrar'

    expect(page).to have_content('Sair')
    expect(current_path).to eq root_path
  end
  scenario 'user can log out in system' do
    user = create(:user)
    login_as(user)

    visit root_path
    
    click_on 'Sair'

    expect(current_path).to eq new_user_session_path
  end
end
