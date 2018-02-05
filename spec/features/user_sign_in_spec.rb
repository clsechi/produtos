require 'rails_helper'

feature 'user can sign in' do
  scenario 'sucessfuly' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    expect(page).to have_content('Logado com sucesso no sistema')
    expect(page).to have_content('Sair')
    epxect(current_path).to root_path
  end
end
