class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :event_title, presence: true, length: { maximum: 25 }
  validates :event_body, presence: true, length: { maximum: 400 }
  validates :event_remark, presence: true, length: { maximum: 100 }
  validates :event_datetime, presence: true
  validates :event_address, presence: true, length: { maximum: 50 }
  validates :event_people, presence: true,
                           numericality: {
                            greater_than: 0
                           }
  # validates :image, presence: true, on: :create

  attachment :image

  geocoded_by :event_address
  after_validation :geocode
end
