class CreateRunners < ActiveRecord::Migration[6.0]
  def change
    create_table :runners do |t|
      t.string :name
      t.integer :age
      t.float :height
      t.integer :weight
      t.float :shoe_size

      t.timestamps
    end
  end
end
