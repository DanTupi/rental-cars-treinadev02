require 'rails_helper'

feature 'user sign in' do
  scenario 'from home page' do
    user = User.create!(email: 'teste@test.com', password: '123456')


    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    within ('form') do
    click_on 'Entrar'
    end

    expect(current_path). to eq(root_path)
    expect(page). to have_content("Olá #{user.email}")
  end

  scenario 'does not see Entrar link' do
    user = User.create!(email: 'teste@test.com', password: '123456')


    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    within ('form') do
    click_on 'Entrar'
  end
  expect(page).not_to have_content('Entrar')

  end
end
