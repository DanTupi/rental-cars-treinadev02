class CarModel < ApplicationRecord
  validates :name, presence: { message: 'Você deve preencher todos os campos'}
  belongs_to :manufacturer
  belongs_to :car_category
end
