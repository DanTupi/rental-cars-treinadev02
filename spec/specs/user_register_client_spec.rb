require 'rails_helper'

feature 'User register client' do
  scenario 'successfully' do
    Client.create!(name: 'Primeiro Nome', email: 'novo@jatinha.com',
                  document: '111.111.111-11' )

    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'
    fill_in 'Nome', with: 'Enzo Valentino'
    fill_in 'Email', with: 'teste@test.com'
    fill_in 'CPF', with: '111.222.333-44'
    click_on 'Enviar'

    expect(page).to have_content('teste@test.com')
    expect(page).to have_content('Enzo Valentino')
    expect(page).to have_content('111.222.333-44')
    expect(page).to have_content('Cliente registrado com sucesso')
  end

  scenario 'and must fill in all fields' do
    Client.create!(name: 'Primeiro Nome', email: 'novo@jatinha.com',
                  document: '111.111.111-11' )

    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'
    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'CPF', with: ''
    click_on 'Enviar'
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
  end
end
