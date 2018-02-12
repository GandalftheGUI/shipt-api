class CreateCategoryAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :category_assignments do |t|
      t.integer :product_id
      t.integer :category_id
      t.timestamps
    end
  end
end
