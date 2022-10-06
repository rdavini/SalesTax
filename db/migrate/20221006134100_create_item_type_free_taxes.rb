class CreateItemTypeFreeTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :item_type_free_taxes do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
