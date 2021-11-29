class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token
  
  validates :prefecture_id, numericality: {other_than: 0 }

  with_options presence: true do
    validates :user_id 
    validates :item_id
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :token
  end
  
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end