class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  validate :end_date_must_be_greater_than_star_date

  def end_date_must_be_greater_than_star_date
    if star_date.blank?
      return errors.add(:star_date, 'deve existir')
    end
    if end_date.blank?
      return errors.add(:end_date, 'End date deve existir')
    end

    if end_date < star_date
      errors.add(:end_date, 'End date deve ser maior que data de início')
    end

  end
end
