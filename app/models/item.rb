class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :load

  validates :title, :explanation, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :load_id, numericality: { other_than: 1, message: "can't be blank"}

end
