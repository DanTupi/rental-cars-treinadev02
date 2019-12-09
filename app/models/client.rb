class Client < ApplicationRecord
  validates :name, presence: { message: 'Nome não pode ficar em branco'}
  validates :name, uniqueness: { message: 'Nome já está em uso'}
  validates :document, presence: { message: 'CPF não pode ficar em branco'}
  validates :email, presence: { message: 'Email não pode ficar em branco'}

  def description
     "#{name} - #{document}"
  end

end
