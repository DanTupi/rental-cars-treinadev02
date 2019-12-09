require 'rails_helper'

feature 'User search rental' do
  scenario 'successfully' do
    user = User.create(email: 'teste@test.com.br', password: '123456')
                        #role: :employee)
    client = Client.create(name: 'Jozé da Silva', email: 'joze@teste.com',
                            document: '743.341.870-90')
    carcategory = CarCategory.create(name: 'A', daily_rate: '100', car_insurance: '120',
                          third_party_insurance: '30')
    rental = Rental.create!(client: client, car_category: carcategory,
                            star_date: 1.day.from_now, end_date: 2.days.days.from_now,
                          reservation_code: 'ABC1234')
    rental2 = Rental.create!(client: client, car_category: carcategory,
                            star_date: 1.day.from_now, end_date: 2.days.days.from_now,
                            reservation_code: 'AAA1111')


    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: 'ABC1234'
    click_on 'Buscar'

    expect(page).to have_content(rental.reservation_code)
    expect(page).not_to have_content(rental2.reservation_code)
  end
end
