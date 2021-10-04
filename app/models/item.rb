class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :load
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image
  #has_one :purchase

  validates :title,             presence: true
  validates :explanation,       presence: true
  validates :image,             presence: true

  validates :category_id,       numericality: { other_than: 0, message: "can't be blank"}
  validates :status_id,         numericality: { other_than: 0, message: "can't be blank"}
  validates :load_id,           numericality: { other_than: 0, message: "can't be blank"}
  validates :prefecture_id,     numericality: { other_than: 0, message: "can't be blank"}
  validates :shipping_days_id,  numericality: { other_than: 0, message: "can't be blank"}
  PRICE_REGEX = /\A([3-9][0-9][0-9]|[0-9]{4,7})\Z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'は半角数字で設定してください'
end
