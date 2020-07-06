class CreateRunnerShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :runner_shoes do |t|
      t.integer :runner_id
      t.integer :shoe_id
      t.float :mileage, default: 0

      t.timestamps
    end
  end
end
