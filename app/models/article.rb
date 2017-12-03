class Article < ApplicationRecord
  belongs_to :user

  validates :article_title, presence: true
  validates :article_body, presence: true, length: { maximum: 500 }
end
