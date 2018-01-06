class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  validates :order_name, presence: true, length: { maximum: 25 }
  validates :order_tel, presence: true, format: {
                                          with: /\A\d+-\d+-\d+\z/
                                        }
  validates :order_birth, presence: true
  validates :order_sex, presence: true
  validates :order_postal_code, presence: true, format: {
                                                  with: /\A\d{7}\z/
                                                }
  validates :order_prefecture, presence: true
  validates :order_city, presence: true, length: { maximum: 50 }
  validates :order_address, presence: true, length: { maximum: 50 }
  validates :order_occupation, presence: true, length: { maximum: 25 }
  validates :order_income, presence: true, numericality: {
                                             greater_than: 0
                                           }
  validates :order_residence, presence: true, length: { maximum: 25 }
  validates :order_description, presence: true, length: { maximum: 400 }

  enum order_sex: { male:0, female:1, other:2 }
  enum order_prefecture: { hokkaido:0, aomori:1, iwate:2, miyagi:3, akita:4, yamagata:5, fukushima:6, ibaraki:7, tochigi:8, gunma:9, saitama:10, chiba:11, tokyo:12, kanagawa:13, niigata:14, toyama:15, ishikawa:16, fukui:17, yamanashi:18, nagano:19, gifu:20, shizuoka:21, aichi:22, mie:23, shiga:24, kyoto:25, osaka:26, hyogo:27, nara:28, wakayama:29, tottori:30, shimane:31, okayama:32, hiroshima:33, yamaguchi:34, tokushima:35, kagawa:36, ehime:37, kochi:38, fukuoka:39, saga:40, nagasaki:41, kumamoto:42, oita:43, miyazaki:44, kagoshima:45, okinawa:46 }
end
