class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :desc
      t.float :price
      t.integer :qty
      t.timestamps
    end
  end
end
