class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.float :distance
      t.float :time
      t.string :type
      t.datetime :date
      t.integer :runner_id
      t.integer :runner_shoe_id

      t.timestamps
    end
  end
end
