class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :level_scores, :quantity, :score
    rename_column :trophies, :level_point_id, :level_score_id
  end
end
