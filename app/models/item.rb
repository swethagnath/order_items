class Item < ApplicationRecord
  validates_presence_of :name, :price, :quantity
  
  def update_quantity(item, order)
    item.quantity -= order.number_of_items
    item.quantity = 0 if item.quantity < 0
    item.save
  end

end
