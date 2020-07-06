class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.string :name
      t.float :price
      t.integer :year
      t.integer :brand_id

      t.timestamps
    end
  end
end
