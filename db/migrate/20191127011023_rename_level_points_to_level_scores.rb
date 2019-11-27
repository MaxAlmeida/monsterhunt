class RenameLevelPointsToLevelScores < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :level_points, :level_scores
  end

  def self.down
    rename_table :level_points, :level_scores
  end
end
