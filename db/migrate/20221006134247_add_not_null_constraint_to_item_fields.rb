class AddNotNullConstraintToItemFields < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :desc, false
    change_column_null :items, :price, false
    change_column_null :items, :qty, false
  end
end
