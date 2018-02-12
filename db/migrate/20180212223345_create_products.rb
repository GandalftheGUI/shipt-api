class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :unit_quantity
      t.float :price
      t.string :unit
      t.timestamps
    end
  end
end
