class CarCategory < ApplicationRecord
  validates :name, presence: { message: 'Você deve preencher todos os campos'}
  #validates :name, uniqueness: { message: 'Categoria já está em uso'}
  has_many :car_models
end
