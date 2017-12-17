class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :event_title, presence: true
  validates :event_body, presence: true, length: { maximum: 500 }
  validates :event_remark, presence: true
  validates :event_datetime, presence: true
  validates :event_address, presence: true
  validates :event_people, presence: true

  attachment :image
  validates_presence_of :image

  geocoded_by :event_address
  after_validation :geocode
end
