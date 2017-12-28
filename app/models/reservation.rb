class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :reservation_name, presence: true, length: { maximum: 25 }
  validates :reservation_tel, presence: true, format: {
                                                with: /\A\d+-\d+-\d+\z/
                                              }
  validates :reservation_people, presence: true, numericality: {
                                                   greater_than: 0,
                                                   less_than: 11
                                                 }
end
