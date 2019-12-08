require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Carros do Tio', cnpj: '11.222.333/4444-55',
                       address: 'Rua dos Bobos, 0')

    visit root_path
    click_on 'Filiais'
    click_on 'Carros do Tio'

    expect(page).to have_content('Carros do Tio')
    expect(page).to have_content('11.222.333/4444-55')
    expect(page).to have_content('Rua dos Bobos, 0')
  end

  scenario 'and view subsidiaries links' do
    Subsidiary.create!(name: 'Carros do Tio', cnpj: '11.222.333/4444-55',
                       address: 'Alameda Santos, 1293')
    Subsidiary.create!(name: 'Somente Motos', cnpj: '22.333.444/5555-66',
                       address: 'Avenida 8, 1200')

    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Carros do Tio')
    expect(page).to have_link('Somente Motos')
  end

  scenario 'and subsidiaries are not registered' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Não existem filiais cadastradas no sistema.')
  end
end
