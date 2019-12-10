require 'rails_helper'

feature 'Admin edit car category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'C', daily_rate: 100, car_insurance: 20,
                        third_party_insurance: 20)

    visit root_path
    click_on 'Categorias de Carros'
    click_on 'C'
    click_on 'Editar'

    fill_in 'Nome', with: 'C'
    fill_in 'Valor da diária', with: '150'
    fill_in 'Valor do seguro', with: '50'
    fill_in 'Seguro contra terceiros', with: '40'
    click_on 'Enviar'

    expect(page).to have_content 'Categoria C'
    expect(page).to have_content 'Preco diario: R$ 150.0'
    expect(page).to have_content 'Valor do Seguro: R$ 50.0'
    expect(page).to have_content 'Seguro contra terceiros: R$ 40.0'
    expect(page).to have_content('Total : R$ 240.0')
  end
end
