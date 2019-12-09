require 'rails_helper'

feature 'Admin edit subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Motos de Sempre', cnpj: '22.333.555/0001-44',
                       address: 'Avenital Tal, 123')
    visit root_path
    click_on 'Filiais'
    click_on 'Motos de Sempre'
    click_on 'Editar'

    fill_in 'Nome', with: 'Carrinhos Bonitos'
    fill_in 'CNPJ', with: '11.333.555/0001-44'
    fill_in 'Endereço', with: 'Avenital Tal, 123'
    click_on 'Enviar'

    expect(page).to have_content 'Carrinhos Bonitos'
    expect(page).to have_content '11.333.555/0001-44'
    expect(page).to have_content 'Endereço: Avenital Tal, 123'
  end

  scenario 'and must fill in all fields' do
    Subsidiary.create!(name: 'Vila Mariana', cnpj: '22.333.555/0001-44',
                       address: 'Avenital Tal, 123')

    visit root_path
    click_on 'Filiais'
    click_on 'Vila Mariana'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Name'
    expect(page).to have_content 'Cnpj não deve ficar em branco'
    expect(page).to have_content 'Address não deve ficar em branco'
  end
end
