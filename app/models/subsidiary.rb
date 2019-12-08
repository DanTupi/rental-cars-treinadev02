class Subsidiary < ApplicationRecord
 validates :name, :cnpj, :address, presence: { message: 'Não deve ficar em branco.' }
 validates :cnpj, uniqueness: { message: 'CNPJ já existe!' }
 validates :cnpj, length: { is: 18, message: 'Deve conter 18 caracteres, somando pontos e barra' }
end
