class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :house_number, :building_name, :telephone_number, :purchase_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :purchase_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :house_number
    validates :telephone_number
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, house_number: house_number, building_name: building_name, purchase_id: purchase.id)
  end
end