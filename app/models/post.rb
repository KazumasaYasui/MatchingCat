class Post < ApplicationRecord
  belongs_to :user
  has_many :post_images, dependent: :destroy

  validates :post_title, presence: true
  validates :post_body, presence: true, length: { maximum: 140 }
  validates :post_image, presence: true

  accepts_attachments_for :post_images, attachment: :image

  private
  def post_image
    post_images_images
  end
end
