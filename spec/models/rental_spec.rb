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
      client = Client.new(name: 'Jozé da Silva', email: 'joze@teste.com',
                              document: '743.341.870-90')
      carcategry = CarCategory.new(name: 'A', daily_rate: 100, car_insurance: 120,
                          third_party_insurance: 30)
      rental = Rental.new(star_date: nil, end_date: '10/12/2019')

      rental.valid?

      expect(rental.errors.full_messages).to eq(['Star date deve existir'])

    end

    xit 'end date must exist' do

    end
  end
end
