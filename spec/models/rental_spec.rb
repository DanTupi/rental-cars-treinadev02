require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe '.end_date_must_be_greater_than_star_date' do
    xit 'success' do
      client = Client.new(name: 'Jozé da Silva', email: 'joze@teste.com',
                              document: '743.341.870-90')
      carcategry = CarCategory.new(name: 'A', daily_rate: 100, car_insurance: 120,
                          third_party_insurance: 30)
      rental = Rental.new(star_date: '09/12/2019', end_date: '10/12/2019')

      rental.valid?

      expect(rental.errors).to be_empty
    end

    xit 'end date less than star date' do
      rental = Rental.new(star_date: '09/12/2019', end_date: '08/12/2019')

      expect(rental.errors.full_messages).to eq([
        'End date deve ser maior que data de início'])
    end
    xit 'end date equal than star date'do

    end
    xit 'star date must exist' do
      subsidiary = Subsidiary.create!(name: 'Almeidinha Cars',
                                      cnpj: '00.000.000/0000-00',
                                      address: 'Alameda Santos, 1293')
      client = Client.new(name: 'Jozé da Silva', email: 'joze@teste.com',
                              document: '743.341.870-90')
      carcategry = CarCategory.new(name: 'A', daily_rate: 100, car_insurance: 120,
                          third_party_insurance: 30)
      manufacturer = Manufacturer.create!(name: 'Fiat')
      car_model = CarModel.create!(name: 'Onix', year: 2000,
                                  manufacturer: manufacturer, fuel_type: 'Flex',
                                  motorization: '1.0',
                                  car_category: carcategory)
      Car.create!(car_model: car_model, license_plate: 'ABC1234',
                  color: 'Verde', mileage: 0, subsidiary: subsidiary)
      rental = Rental.new(star_date: nil, end_date: '10/12/2019')

      rental.valid?

      expect(rental.errors.full_messages).to include('Star date deve existir')

    end

    xit 'end date must exist' do

    end
  end

  describe '.cars_available' do
    it 'should be false if subsidiary has no cars' do
      subsidiary = Subsidiary.create!(name: 'Almeidinha Cars',
                                      cnpj: '00.000.000/0000-00',
                                      address: 'Alameda Santos, 1293')
      client = Client.create!(name: 'Jozé da Silva', email: 'joze@teste.com',
                              document: '743.341.870-90')
      carcategory = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 120,
                          third_party_insurance: 30)
      manufacturer = Manufacturer.create!(name: 'Fiat')
      car_model = CarModel.create!(name: 'Onix', year: 2000,
                                   manufacturer: manufacturer, fuel_type: 'Flex',
                                   motorization: '1.0',
                                   car_category: carcategory)
      Car.create!(car_model: car_model, license_plate: 'ABC1234',
                  color: 'Verde', mileage: 0, subsidiary: subsidiary)
      rental = Rental.new(star_date: '09/12/2019', end_date: '10/12/2019',
                          client: client, car_category: carcategory,
                          subsidiary: subsidiary)
      result = rental.cars_availabe

      expect(result). to be false
    end
    it 'should be false if has no cars from rental category' do
      subsidiary = Subsidiary.create!(name: 'Almeidinha Cars',
                                      cnpj: '00.000.000/0000-00',
                                      address: 'Alameda Santos, 1293')
      client = Client.new(name: 'Jozé da Silva', email: 'joze@teste.com',
                              document: '743.341.870-90')
      carcategory = CarCategory.new(name: 'A', daily_rate: 100, car_insurance: 120,
                          third_party_insurance: 30)
      other_carcategory = CarCategory.new(name: 'B', daily_rate: 120, car_insurance: 140,
                          third_party_insurance: 40)
      manufacturer = Manufacturer.create!(name: 'Fiat')
      rental = Rental.new(star_date: '09/12/2019', end_date: '10/12/2019',
                          client: client, car_category: other_carcategory,
                          subsidiary: subsidiary)
      result = rental.cars_availabe

      expect(result). to be false
    end

    xit 'should be false if subsidiary has rentals scheduled' do
      subsidiary = Subsidiary.create!(name: 'Almeidinha Cars',
                                      cnpj: '00.000.000/0000-00',
                                      address: 'Alameda Santos, 1293')
      client = Client.new(name: 'Jozé da Silva', email: 'joze@teste.com',
                              document: '743.341.870-90')
      carcategry = CarCategory.new(name: 'A', daily_rate: 100, car_insurance: 120,
                          third_party_insurance: 30)
      manufacturer = Manufacturer.create!(name: 'Fiat')
      car_model = CarModel.create!(name: 'Onix', year: 2000,
                                  manufacturer: manufacturer, fuel_type: 'Flex',
                                  motorization: '1.0',
                                  car_category: carcategory)
      Car.create!(car_model: car_model, license_plate: 'ABC1234',
                  color: 'Verde', mileage: 0, subsidiary: subsidiary)
      scheduled_rental = Rental.new(star_date: 1.day.from_now, end_date: 2.days_from_now,
                          client: client, car_category: other_carcategory,
                          subsidiary: subsidiary)

      new_rental = Rental.new(star_date:  1.day_from_now, end_date: 2.days_trom_now,
                          client: client, car_category: other_carcategory,
                          subsidiary: subsidiary)

      #result =
      expect(result). to be false
    end

  end
end
