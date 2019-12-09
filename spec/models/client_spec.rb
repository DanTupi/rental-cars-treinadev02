require 'rails_helper'

describe Client do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '.description' do
    it 'must return name with document' do
      client = Client.new(name: 'Nome Sobrenome', document: '743.341.870-90', email: 'nome@hotmail.com')

      expect(client.description).to eq 'Nome Sobrenome - 743.341.870-90'
    end
  end

end
