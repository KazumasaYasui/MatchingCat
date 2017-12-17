class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  with_options on: :complete_reservation do |complete|
    complete.validates :reservation_name, presence: true
    complete.validates :reservation_tel, presence: true
    complete.validates :reservation_people, presence: true
  end
end
