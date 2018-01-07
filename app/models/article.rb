class Article < ApplicationRecord
  belongs_to :user

  validates :article_title, presence: true, length: { maximum: 25 }
  validates :article_body, presence: true, length: { maximum: 1600 }
  # validates :image, presence: true

  attachment :image
end
