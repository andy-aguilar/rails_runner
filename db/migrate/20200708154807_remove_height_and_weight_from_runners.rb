class RemoveHeightAndWeightFromRunners < ActiveRecord::Migration[6.0]
  def change
    remove_column :runners, :height
    remove_column :runners, :weight
  end
end
