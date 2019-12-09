class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  validate :end_date_must_be_greater_than_star_date

  def end_date_must_be_greater_than_star_date
    #if star_date.blank? || end_date.blank?
      #return errors.add(:base, 'Datas devem existir')
    #end

    if star_date.blank?
      erros.add(:star_date, 'deve existir')
    end

    if end_date < star_date
      errors.add(:end_date, 'deve ser maior que data de início')
    end

  end
end
