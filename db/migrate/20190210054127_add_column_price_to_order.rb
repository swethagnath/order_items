class AddColumnPriceToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :price, :float  
  end
end
