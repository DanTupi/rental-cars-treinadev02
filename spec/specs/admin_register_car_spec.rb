require 'rails_helper'

feature 'Admin register car' do
  scenario 'successfully without any car registered' do
    Subsidiary.create!(name: 'Carros3', cnpj: '123456789012345678', address: 'Rua dos Pombos')
    Subsidiary.create!(name: 'Carros1',cnpj: '987654321098765432', address: 'Rua das Maritacas')
    Manufacturer.create!(name: 'GM')
    Manufacturer.create!(name: 'Citroen')
    CarCategory.create!(name: 'A', daily_rate: 90, car_insurance: 50,
                        third_party_insurance: 40)
    CarCategory.create!(name: 'B', daily_rate: 120, car_insurance: 60,
                        third_party_insurance: 60)
    CarModel.create!(name: 'Onix', fuel_type: 'flex', motorization: '1.0', year: '2018', manufacturer_id: 1, car_category_id: 1)
    CarModel.create!(name: 'Xsara', fuel_type: 'gasolina', motorization: '1.8', year: '2008', manufacturer_id: 2, car_category_id: 2)

    visit root_path
    click_on 'Registrar Carros'
    click_on 'Clique aqui'

    fill_in 'Placa', with: 'ABC-1234'
    fill_in 'Cor', with: 'Verde'
    select 'Onix', from: 'Modelo'
    fill_in 'Quilometragem', with: '200'
    select 'Carros3', from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content('ABC-1234')
    expect(page).to have_content('Verde')
    expect(page).to have_content('Onix')
    expect(page).to have_content( '200')
    expect(page).to have_content('Carros3')
  end

  scenario 'successfully with at least car registered' do
    #Subsidiary.create(name: 'Carros3', cnpj: '123456789012345678', address: 'Rua dos Pombos')
    #Subsidiary.create(name: 'Carros1',cnpj: '987654321098765432', address: 'Rua das Maritacas')
    #Manufacturer.create(name: 'GM')
    #Manufacturer.create(name: 'Citroen')
    #CarCategory.create(name: 'A', daily_rate: 90, car_insurance: 50,
                      #  third_party_insurance: 40)
    #CarCategory.create(name: 'B', daily_rate: 120, car_insurance: 60,
                      #  third_party_insurance: 60)
    #CarModel.create(name: 'Onix')
    #CarModel.create(name: 'Xsara')
    #Car.create!(license_plate: 'WYZ-9876', color: 'Azul',
                      #          mileage: '300' )


    #visit root_path
    #click_on 'Registrar Carro'
    #click_on 'Registrar novo Veículo'

    #fill_in 'Placa', with: 'ABC-1234'
    #fill_in 'Cor', with: 'Verde'
    #select 'Onix', from: 'Modelo de Carro'
    #fill_in 'Quilometragem', with: '200'
    #select 'Carros3', from: 'Filiais'
    #click_on 'Enviar'

    #expect(page).to have_content('ABC-1234')
    #expect(page).to have_content('Verde')
    #expect(page).to have_content('Onix')
    #expect(page).to have_content( '200 kms')
    #expect(page).to have_content('Carros3')
  end

end
