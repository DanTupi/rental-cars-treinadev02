class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  validate :end_date_must_be_greater_than_star_date
  enum status: { scheduled: 0, in_progress: 5 }
  has_one :car_rentals
  has_one :car, through: :car_rental

  def end_date_must_be_greater_than_star_date
    return unless star_date.present? && end_date.present?

    if end_date <= star_date
      errors.add(:end_date, 'End date deve ser maior que data de início')
    end

    def star_date_equal_or_greater_than_today
      renturn unless_date.present?

      if star_date <Date.current
        errors.add(:star_date.present? && end_date.present?)
      end
    end

    #def cars_availabe
    #    return unless star_date.present? && end_date.present?

    #    if cars_availabe_at_date_range
    #      erros.add(:carcategory)
    #if star_date.blank?
    #  return errors.add(:star_date, 'deve existir')
    #end
    #if end_date.blank?
    #  return errors.add(:end_date, 'End date deve existir')
    #end



  end
end
