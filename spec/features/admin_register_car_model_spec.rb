require 'rails_helper'

feature 'Admin register car model' do
  scenario 'successfully' do
    user = User.create!(email: 'teste@test.com', password: '123456')
                       #role: :admin)

    login_as(user, scope: :user)
    Manufacturer.create!(name: 'GM')
    Manufacturer.create!(name: 'Honda')
    CarCategory.create!(name: 'A', daily_rate: 90, car_insurance: 50,
                        third_party_insurance: 40)
    CarCategory.create!(name: 'B', daily_rate: 120, car_insurance: 60,
                        third_party_insurance: 60)

    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Clique aqui'

    fill_in 'Nome', with: 'Fit'
    fill_in 'Ano', with: '2019'
    fill_in 'Motorização', with: '1.5'
    fill_in 'Combustível', with: 'Flex'
    select 'Honda', from: 'Fabricante'
    select 'A', from: 'Categoria'

    click_on 'Enviar'

    #expect(page).to have_content('Modelo registrado com sucesso')
    expect(page).to have_css('h1', text: 'Fit')
    expect(page).to have_content('Ano: 2019')
    expect(page).to have_content('Fabricante: Honda')
    expect(page).to have_content('Categoria: A')
  end

  scenario 'and do not register but wants to go back to car models page' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Clique aqui'
    click_on 'Voltar'

    expect(current_path).to eq car_models_path
  end


end
