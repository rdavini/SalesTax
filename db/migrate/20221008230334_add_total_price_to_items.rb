class AddTotalPriceToItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :price, :decimal
    add_column :items, :total_price, :decimal, null: false
  end
end
