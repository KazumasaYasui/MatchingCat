class Event < ApplicationRecord
  belongs_to :user

  validates :event_title, presence: true
  validates :event_body, presence: true, length: { maximum: 500 }
  validates :event_remark, presence: true
  validates :event_place, presence: true
  validates :event_datetime, presence: true
end
