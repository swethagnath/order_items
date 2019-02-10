class ChangeTypeOfColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :item, :string
  end
end
