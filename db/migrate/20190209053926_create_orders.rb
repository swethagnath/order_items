class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :item
      t.integer :number_of_items
      t.string :email_id

      t.timestamps
    end
  end
end
