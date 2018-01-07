class Cat < ApplicationRecord
  belongs_to :user
  has_many :cat_images, dependent: :destroy
  has_one :order, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :cat_name, presence: true, length: { maximum: 25 }
  validates :cat_age, presence: true,
                      numericality: { greater_than_or_equal_to: 0 }
  validates :cat_sex, presence: true
  validates :cat_breed, presence: true
  validates :cat_prefecture, presence: true
  validates :cat_description, presence: true, length: { maximum: 400 }
  # validates :cat_image, presence: true, on: :create

  accepts_attachments_for :cat_images, attachment: :image

  enum cat_sex: { male:0, female:1 }
  enum cat_breed: { abyssinian:0, americancurl:1, americanshorthair:2, exoticshorthair:3, egyptianmau:4, ocicat:5, orientalshorthair:6, cornishrex:7, siberian:8, siamese:9, chartreux:10, singapura:11, japanesebobtail:12, scotishfold:13, sphynx:14, selkirkrex:15, somali:16, devonrex:17, tonkinese:18, norwegianforestcat:19, birman:20, himalayan:21, britishshorthair:22, bengal:23, persian:24, manx:25, munchkin:26, minuet:27, mainecoon:28, ragamuffin:29, ragdoll:30, laperm:31, russianblue:32, mix:33, others:34 }
  enum cat_prefecture: { hokkaido:0, aomori:1, iwate:2, miyagi:3, akita:4, yamagata:5, fukushima:6, ibaraki:7, tochigi:8, gunma:9, saitama:10, chiba:11, tokyo:12, kanagawa:13, niigata:14, toyama:15, ishikawa:16, fukui:17, yamanashi:18, nagano:19, gifu:20, shizuoka:21, aichi:22, mie:23, shiga:24, kyoto:25, osaka:26, hyogo:27, nara:28, wakayama:29, tottori:30, shimane:31, okayama:32, hiroshima:33, yamaguchi:34, tokushima:35, kagawa:36, ehime:37, kochi:38, fukuoka:39, saga:40, nagasaki:41, kumamoto:42, oita:43, miyazaki:44, kagoshima:45, okinawa:46 }

scope :get_by_cat_sex, -> (cat_sex) {
  where( cat_sex: cat_sex ) unless cat_sex.nil?
}
scope :get_by_cat_breed, -> (cat_breed) {
  where( cat_breed: cat_breed ) unless cat_breed.nil?
}
scope :get_by_cat_prefecture, -> (cat_prefecture) {
  where( cat_prefecture: cat_prefecture ) unless cat_prefecture.nil?
}

  def favorited_by? user
    favorites.where(user_id: user.id).exists?
  end

  private
  def cat_image
    cat_images_images
  end
end
