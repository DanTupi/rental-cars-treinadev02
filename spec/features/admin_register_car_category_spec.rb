require 'rails_helper'

feature 'Admin register car car_category' do
  scenario 'successfully without any car car_category registered' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Clique aqui'

    fill_in 'Nome da categoria', with: 'Sedan'
    fill_in 'Valor da diária', with: '110'
    fill_in 'Valor do seguro', with: '40'
    fill_in 'Seguro contra terceiros', with: '25'
    click_on 'Enviar'

    expect(page).to have_content('Sedan')
    expect(page).to have_content('R$ 110.0')
    expect(page).to have_content('R$ 40.0')
    expect(page).to have_content('R$ 25.0')
    expect(page).to have_content('Total : R$ 175.0')
  end

  scenario 'and with car registered on database' do
    CarCategory.create!(name: 'Hatch', daily_rate: 90, car_insurance: 50, third_party_insurance: 20)

    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Cadastrar nova categoria'

    fill_in 'Nome da categoria', with: 'Hatch'
    fill_in 'Valor da diária', with: '120'
    fill_in 'Valor do seguro', with: '60'
    fill_in 'Seguro contra terceiros', with: '30'
    click_on 'Enviar'

    expect(page).to have_content('Hatch')
    expect(page).to have_content('R$ 120.0')
    expect(page).to have_content('R$ 60.0')
    expect(page).to have_content('R$ 30.0')
    expect(page).to have_content('Total : R$ 210.0')
  end

  scenario 'and do not create but return to car car_categories page' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Clique aqui'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end
