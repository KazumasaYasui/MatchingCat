class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  validates :user, presence: true
  validates :user_id, uniqueness: {scope: :cat_id}
  validates :cat, presence: true
end
