class Order < ApplicationRecord
  validates_presence_of :item, :number_of_items, :email_id

  def price_calculation(item, number_of_items)
    self.price = item.price * number_of_items
  end

end
