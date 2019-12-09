require 'rails_helper'

feature 'user schedule rental' do
  scenario 'successfullty' do
    user = User.create(email: 'teste@test.com.br', password: '123456')
                        #role: :employee)
    client = Client.create(name: 'Jozé da Silva', email: 'joze@teste.com',
                            document: '743.341.870-90')
    carcategory = CarCategory.create(name: 'A', daily_rate: '100', car_insurance: '120',
                          third_party_insurance: '30')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Locações'
    click_on 'Agendar locações'
    fill_in 'Data de início', with: '09/12/2019'
    fill_in 'Data de fim', with: '12/12/2019'
    select 'Jozé da Silva - 743.341.870-90', from: 'Cliente'
    select carcategory.name, from: 'Categoria do Carro'
    click_on 'Enviar'

    expect(page).to have_content('Locação agendada com sucesso')
    expect(page).to have_content('Data de início: 09/12/19')
    expect(page).to have_content('Data de fim: 12/12/19')
    expect(page).to have_content(client.name)
    expect(page).to have_content(client.document)
    expect(page).to have_content(carcategory.name)
  end

  xscenario 'and must fill all fields' do

  end

  xscenario 'and start date must be less to end date' do

  end

end
