class Cat < ApplicationRecord
  belongs_to :user
  has_many :cat_images, dependent: :destroy
  has_one :order, dependent: :destroy
  validates :cat_name, presence: true
  validates :cat_age, presence: true,
                      numericality: { greater_than_or_equal_to: 0 }
  validates :cat_sex, presence: true
  validates :cat_breed, presence: true
  validates :cat_prefecture, presence: true
  validates :cat_description, length: { maximum: 500 }
  validates :cat_image, presence: true

  accepts_attachments_for :cat_images, attachment: :image

  enum cat_sex: { male:0, female:1 }
  enum cat_breed: { cat_a:0, cat_b:1, cat_c:2, cat_d:3, cat_e:4, cat_f:5, cat_g:6, cat_h:7, cat_i:8, cat_j:9, cat_k:10, cat_l:11, cat_m:12, cat_n:13, cat_o:14, cat_p:15, cat_q:16, cat_r:17, cat_s:18, cat_t:19, cat_u:20, cat_v:21, cat_w:22, cat_x:23, cat_y:24, cat_z:25 }
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

  private
  def cat_image
    cat_images_images
  end
end
